import database from '../config/database.js'
import Stripe from 'stripe'
import { FRONTEND_URL } from '../config/constants.js';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY);

const placeOrder = async (req, res) => {
    const { username } = req.user;
    const { cartItems, shipping_details } = req.body;

    const insert_orders_query = "INSERT INTO online_orders(order_id, username, shipping_details) VALUES(?, ?, ?)";
    const insert_order_details_query = "INSERT INTO online_order_details VALUES(?, ?, ?)";
    const update_cart_query = "UPDATE users SET cart = '{}' WHERE username = ?";

    console.log("printing items: ")
    console.log(cartItems);


    try {
        const order_id = String(Math.floor(performance.now()) + Date.now());
        await database.promise().query(insert_orders_query, [order_id, username, shipping_details]);

        cartItems.forEach( async (item) => {
            await database.promise().query(insert_order_details_query, [order_id, item.product_id, item.quantity]);
        })
        await database.promise().query(update_cart_query, [username]);

        const line_items = cartItems.map((item) => ({
            price_data: {
                currency: "usd",
                product_data: {
                    name: item.product_name
                },
                unit_amount: item.price * 1 * 8
            },
            quantity: item.quantity
        }))

        line_items.push({
            price_data: {
                currency: "usd", // Ensure this currency is supported by your enabled payment methods
                product_data: {
                    name: "Delivery Charges"
                },
                unit_amount: 3 * 10 * 8 // Ensure correct conversion
            },
            quantity: 1
        })

        console.log("Before stripe session");
        const session = await stripe.checkout.sessions.create({
            line_items: line_items,
            mode: "payment",
            success_url: `${FRONTEND_URL}/verifyOrder?success=true&order_id=${order_id}`,
            cancel_url: `${FRONTEND_URL}/verifyOrder?success=false&order_id=${order_id}`
        })
        console.log("session.url: " + session.url);
        res.json({success: true, session_url: session.url });
    }
    catch (error) {
        console.error("(PlaceOrder) Error placing order: ", error);
        res.json({sucess: false, message: "Error placing order" });
    }
}

const verifyOrder = async (req, res) => {
    const {order_id, success} = req.body;
    const update_query = "UPDATE online_orders SET payment = ? WHERE order_id = ?";
    try {
        if (success == "true") {
            await database.promise().query(update_query, [1, order_id]);
            res.json({success: true, message: "Paid"})
        }
    }
    catch (error) {
        console.error("(VerifyOrder) Error verifying order: ", error);
        return res.json({success: false, message: "Error verifying order"});
    }
}

export { placeOrder, verifyOrder }