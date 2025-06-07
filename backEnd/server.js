import express from 'express'
import cors from 'cors'
import dotenv from 'dotenv'
import database from './config/database.js'
import productRouter from './routes/productRoute.js';
import userRouter from './routes/userRoute.js';
import cartRouter from './routes/cartRoute.js';
import orderRouter from './routes/orderRoute.js';

dotenv.config();


// app config
const app = express()
const port = process.env.SERVER_PORT 


// middleware
app.use(express.json())
app.use(cors())


// test connection query
app.get("/testdb", async (req, res) => { // Make the handler async
    try {
        // Note: with mysql2's promise wrapper, query returns [results, fields]
        const [results, fields] = await database.query('SELECT 1 + 1 AS solution');
        res.json({ message: 'Database query successful!', solution: results[0].solution });
    } catch (error) {
        console.error('Error executing query:', error);
        return res.status(500).send('Error querying the database');
    }
});

// api endpoints
app.use('/api/product', productRouter)
app.use("/images", express.static('uploads'))
app.use("/api/user", userRouter)
app.use("/api/cart", cartRouter)
app.use("/api/order", orderRouter)

//
app.get("/", (req, res) => {
    res.send("API Working")
})

app.listen(port, () => {
    console.log(`Server Started on http://localhost:${port}`)
})