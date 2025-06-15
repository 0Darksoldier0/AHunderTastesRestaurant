import express from 'express'
import { authenticateToken } from '../middleware/authentication.js';

import { getAvailableTable, updateTableStatus, createOrder } from '../controller/inHouseOrderController.js';

const inHouseOrderRouter = express.Router();

inHouseOrderRouter.post('/getTable', authenticateToken, getAvailableTable);
inHouseOrderRouter.post('/updateTableStatus', authenticateToken, updateTableStatus)
inHouseOrderRouter.post('/createOrder', authenticateToken, createOrder)

export default inHouseOrderRouter