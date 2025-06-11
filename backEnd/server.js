import express from 'express'
import cors from 'cors'
import dotenv from 'dotenv'
import database from './config/database.js'
import productRouter from './routes/productRoute.js';
import userRouter from './routes/userRoute.js';
import cartRouter from './routes/cartRoute.js';
import orderRouter from './routes/orderRoute.js';
import * as cron from 'node-cron';

dotenv.config();


// app config
const app = express()
const port = process.env.SERVER_PORT 


// middleware
app.use(express.json())
app.use(cors())


// test connection query
// app.get("/testdb", async (req, res) => { // Make the handler async
//     try {
//         const [results, fields] = await database.promise().query('SELECT 1 + 1 AS solution');
//         res.json({ message: 'Database query successful!', solution: results[0].solution });
//     } catch (error) {
//         console.error('Error executing query:', error);
//         return res.status(500).send('Error querying the database');
//     }
// });

// api endpoints
app.use('/api/product', productRouter)
app.use("/images", express.static('uploads'))
app.use("/api/user", userRouter)
app.use("/api/cart", cartRouter)
app.use("/api/order", orderRouter)


// Start maintenance mode
cron.schedule('0 0 * * *', () => {
    console.log('Running scheduled task: Starting daily maintenance window.');
    setMaintenanceMode(true);
});

// End maintenance mode
cron.schedule('5 0 * * *', () => {
    console.log('Running scheduled task: Ending daily maintenance window.');
    setMaintenanceMode(false);
});


app.listen(port, () => {
    console.log(`Server Started on http://localhost:${port}`)
})
