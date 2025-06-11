import express from 'express'
import {addProduct, removeProduct, listProducts, listAvailableProducts, updateProduct, updateProductImage, getProductPrice} from '../controller/productController.js'
import multer from 'multer'
import { authenticateToken } from '../middleware/authentication.js'
import {checkAccountType} from  '../middleware/checkAccountType.js'
import { checkMaintenanceMode } from '../middleware/checkMaintenanceMode.js'

const productRouter = express.Router();

// store product images
const storage = multer .diskStorage({
    destination: "uploads",
    filename: (req, file, callback) => {
        return callback(null, `${Date.now()}${file.originalname}`)
    } 
})

const upload = multer({storage:storage})

productRouter.post("/add", authenticateToken, checkAccountType, checkMaintenanceMode, upload.single("image"), addProduct) 
productRouter.post("/remove", authenticateToken, checkAccountType, checkMaintenanceMode, removeProduct)
productRouter.post("/update", authenticateToken, checkAccountType, checkMaintenanceMode, updateProduct)
productRouter.post("/updateimage", authenticateToken, checkAccountType, checkMaintenanceMode, upload.single("image"), updateProductImage)
productRouter.post("/getprice", authenticateToken, checkAccountType, getProductPrice)
productRouter.post("/listall", authenticateToken, checkAccountType, listProducts)
productRouter.get("/listavailable", listAvailableProducts)

export default productRouter;