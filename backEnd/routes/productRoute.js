import express from 'express'
import {addProduct, removeProduct, listProducts, listAvailableProducts, updateProduct, updateProductImage} from '../controller/productController.js'
import multer from 'multer'
import { authenticateToken } from '../middleware/authentication.js'
import {checkAccountType} from  '../middleware/checkAccountType.js'

const productRouter = express.Router();

// store product images
const storage = multer .diskStorage({
    destination: "uploads",
    filename: (req, file, callback) => {
        return callback(null, `${Date.now()}${file.originalname}`)
    } 
})

const upload = multer({storage:storage})

productRouter.post("/add", authenticateToken, checkAccountType, upload.single("image"), addProduct) 
productRouter.post("/listall", authenticateToken, checkAccountType, listProducts)
productRouter.get("/listavailable", listAvailableProducts)
productRouter.post("/remove", authenticateToken, checkAccountType, removeProduct)
productRouter.post("/update", authenticateToken, checkAccountType, updateProduct)
productRouter.post("/updateimage", authenticateToken, checkAccountType, upload.single("image"), updateProductImage)



export default productRouter;