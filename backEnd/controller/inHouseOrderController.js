import database from '../config/database.js'

const getAvailableTable = async (req, res) => {
    const select_query = "SELECT seat_id FROM seat WHERE availability = 1";

    try {
        const [results] = await database.promise().query(select_query);
        return res.status(200).json({tables: results});
    }
    catch (error) {
        console.error("(GetAvailableTable) Error fetching tables: ", error);
        return res.status(500).json({message: "Error fetching tables"})
    }
}

const updateTableStatus = async (req, res) => {
    const {availability, seat_id} = req.body;
    const update_query = "UPDATE seat SET availability = ? WHERE seat_id = ?";

    try {
        await database.promise().query(update_query, [availability, seat_id]);
        return res.status(200).json({message: "Table status updated"})
    }
    catch (error) {
        console.error("(UpdateTableStatus) Error updating table status: ", error);
        return res.status(500).json({message: "Error updating table status"});
    }
}

const createOrder = async (req, res) => {
    const {seat_id, customer_name} = req.body;
    const {username} = req.user;

    const insert_query = "INSERT INTO in_house_orders(order_id, staff_incharged_username, seat_id, customer_name) VALUES(?, ?, ?, ?)";

    const order_id = String(Math.floor(performance.now()) + Date.now());

    try {
        const select_query = "SELECT availability FROM seat WHERE seat_id = ?"
        const [results] = await database.promise().query(select_query, [seat_id]);

        if (results[0].availability === 0) {
            return res.status(406).json({message: `Table ${seat_id} is unavailable, check your input again`});
        }
    }
    catch (error) {
        console.error("(CreateOrder-SelectTable) Error creating order: ", error);
        return res.status(500).json({message: "Error creating order"})
    }

    try {
        await database.promise().query(insert_query, [order_id, username, seat_id, customer_name]);
        return res.status(200).json({order_id: order_id, message: "Order Created"})
    }
    catch (error) {
        console.error("(CreateOrder) Error creating order: ", error);
        return res.status(500).json({message: "Error creating order"});
    }
}

export {getAvailableTable, updateTableStatus, createOrder}