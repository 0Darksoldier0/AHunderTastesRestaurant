import database from '../config/database.js'

const getAvailableTable = async (req, res) => {
    const select_query = "SELECT seat_id FROM seat WHERE status = 1";

    try {
        const [results] = await database.promise().query(select_query);
        return res.status(200).json({tables: results});
    }
    catch (error) {
        console.error("(GetAvailableTable) Error fetching tables: ", error);
        return res.staus(500).json({message: "Error fetching tables"})
    }
}

const updateTableStatus = async (req, res) => {
    const {status, seat_id} = req.body;
    const update_query = "UPDATE seat SET status = ? WHERE seat_id = ?";

    try {
        await database.promise().query(update_query, [status, seat_id]);
        return res.status(200).json({message: "Table status updated"})
    }
    catch (error) {
        console.error("(UpdateTableStatus) Error updating table status: ", error);
        return res.status(500).json({message: "Error updating table status"});
    }
}

export {getAvailableTable, updateTableStatus}