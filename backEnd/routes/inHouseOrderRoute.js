import express from 'express'
import { authenticateToken } from '../middleware/authentication.js';

import { getAvailableTable, updateTableStatus, createOrder, addItemsToOrder, getSeatAvailability, 
    getInHouseOrderDetails, getOrderData, getInHouseOrders, updateProductServed, updateProductQuantity, updatePayment } from '../controller/inHouseOrderController.js';

const inHouseOrderRouter = express.Router();

inHouseOrderRouter.post('/getTable', authenticateToken, getAvailableTable);
inHouseOrderRouter.post('/updateTableStatus', authenticateToken, updateTableStatus)
inHouseOrderRouter.post('/createOrder', authenticateToken, createOrder)
inHouseOrderRouter.post('/addItems', authenticateToken, addItemsToOrder)
inHouseOrderRouter.post('/getDetails', authenticateToken, getInHouseOrderDetails)
inHouseOrderRouter.post('/getOrderData', authenticateToken, getOrderData)
inHouseOrderRouter.post('/list', authenticateToken, getInHouseOrders)
inHouseOrderRouter.post('/updateServedQuantity', authenticateToken, updateProductServed)
inHouseOrderRouter.post('/updateQuantity', authenticateToken, updateProductQuantity)
inHouseOrderRouter.post('/updatePayment', authenticateToken, updatePayment)
inHouseOrderRouter.post('/getSeatAvail', authenticateToken, getSeatAvailability)


export default inHouseOrderRouter