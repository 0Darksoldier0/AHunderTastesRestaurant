import express from 'express'
import {addProduct, removeProduct, listProducts, listAvailableProducts, updateProduct, updateProductImage} from '../controller/productController.js'
import multer from 'multer'
import { authenticateToken } from '../middleware/authentication.js'

const productRouter = express.Router();

// store product images
const storage = multer .diskStorage({
    destination: "uploads",
    filename: (req, file, callback) => {
        return callback(null, `${Date.now()}${file.originalname}`)
    } 
})

const upload = multer({storage:storage})

productRouter.post("/add", authenticateToken, upload.single("image"), addProduct) 
productRouter.post("/listall", authenticateToken, listProducts)
productRouter.get("/listavailable", listAvailableProducts)
productRouter.post("/remove", authenticateToken, removeProduct)
productRouter.post("/update", authenticateToken, updateProduct)
productRouter.post("/updateimage", authenticateToken, upload.single("image"), updateProductImage)



export default productRouter;