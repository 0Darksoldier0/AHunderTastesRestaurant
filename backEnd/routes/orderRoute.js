import express from 'express'
import { authenticateToken } from '../middleware/authentication.js'
import { placeOrder } from '../controller/orderController.js'

const orderRouter = express.Router();

orderRouter.post('/place', authenticateToken, placeOrder);

export default orderRouter;