import database from '../config/database.js'
import Stripe from 'stripe'

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY);

const placeOrder = async (req, res) => {
    try {


    }
    catch (error) {

    }
}

export {placeOrder}