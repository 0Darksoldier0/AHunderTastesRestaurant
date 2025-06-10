import express from 'express'
import { authenticateToken } from '../middleware/authentication.js'
import { placeOrder, verifyOrder, getUserOrders, getOrderDetails } from '../controller/orderController.js'

const orderRouter = express.Router();

orderRouter.post('/place', authenticateToken, placeOrder);
orderRouter.post('/verifyOrder', verifyOrder);
orderRouter.post('/getUserOrders', authenticateToken, getUserOrders);
orderRouter.post('/getOrderDetails', authenticateToken, getOrderDetails)
export default orderRouter;