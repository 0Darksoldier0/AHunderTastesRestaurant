import express from 'express'
import { authenticateToken } from '../middleware/authentication.js'
import { placeOrder, verifyOrder, getUserOrders, getOrderDetails, getOrders, updateStatus } from '../controller/orderController.js'
import { checkAccountType } from '../middleware/checkAccountType.js';

const orderRouter = express.Router();

orderRouter.post('/place', authenticateToken, placeOrder);
orderRouter.post('/verifyOrder', verifyOrder);
orderRouter.post('/getUserOrders', authenticateToken, getUserOrders);
orderRouter.post('/getOrderDetails', authenticateToken, getOrderDetails)
orderRouter.post('/list', authenticateToken, checkAccountType, getOrders)
orderRouter.post('/updateStatus', authenticateToken, checkAccountType, updateStatus)
export default orderRouter;