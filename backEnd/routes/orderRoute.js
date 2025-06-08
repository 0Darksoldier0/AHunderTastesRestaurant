import express from 'express'
import { authenticateToken } from '../middleware/authentication.js'
import { placeOrder, verifyOrder } from '../controller/orderController.js'

const orderRouter = express.Router();

orderRouter.post('/place', authenticateToken, placeOrder);
orderRouter.post('/verifyOrder', verifyOrder)

export default orderRouter;