import database from '../config/database.js'
import Stripe from 'stripe'
import { FRONTEND_URL } from '../config/constants.js';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY);

const placeOrder = async (req, res) => {
    const {username} = req.user;
    const {cartItems, shipping_details} = req.body;

    const insert_query = "INSERT INTO online_orders(order_id, username, shipping_details) VALUES(?, ?, ?)";
    const update_cart_query = "UPDATE users SET cart = '{}' WHERE username = ?";

    console.log("printing items: ")
    console.log(cartItems);
    console.log("printing shipping details")


    try {
        const order_id = String(Math.floor(performance.now()) + Date.now());
        await database.promise().query(insert_query, [order_id, username, shipping_details]);

        // await database.promise().query(update_cart_query, [username]);

        const line_items = cartItems.map((item) => ({
            price_data: {
                currency: "vnd", // Ensure this currency is supported by your enabled payment methods
                product_data: {
                    name: item.product_name
                },
                unit_amount: item.price*1*8 // Ensure correct conversion to smallest currency unit (cents/dong)
            },
            quantity: item.quantity
        }))

        line_items.push({
            price_data: {
                currency: "vnd", // Ensure this currency is supported by your enabled payment methods
                product_data: {
                    name: "Delivery Charges"
                },
                unit_amount: 3*10*8 // Ensure correct conversion
            },
            quantity: 1
        })
        const session = await stripe.checkout.sessions.create({
            line_items: line_items,
            mode: "payment",
            success_url: `${FRONTEND_URL}/verify?success=true&orderId=${order_id}`,
            cancel_url: `${FRONTEND_URL}/verify?success=false&orderId=${order_id}`,
            payment_method_types: ['card'],
        })
       
        return res.status(200).json({session_url: session.url});
    }
    catch (error) {
        console.error("(PlaceOrder) Error placing order: ", error);
        return res.status(500).json({message: "Error placing order"});
    }
}

export {placeOrder}
