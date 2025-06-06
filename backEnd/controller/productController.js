import fs from 'fs'
import database from '../config/database.js';

// add a product
const addProduct = async (req, res) => {
    let image_filename = `${req.file.filename}`;
    let data = req.body;
    const { product_name, price, description, category_id, availability } = req.body;
    const checkProductName_query = "SELECT * FROM products WHERE product_name =?";
    const insertProduct_query = "INSERT INTO products(product_name, price, description, image, category_id, availability) VALUES(?, ?, ?, ?, ?, ?)";

    try {
        const [results] = await database.promise().query(checkProductName_query, [data.product_name]);
        if (results.length > 0) {
            fs.unlink(`./uploads/${image_filename}`, err => {
                if (err) {
                    console.error("Failed to unlink uploaded file", err);
                }
            });
            return res.status(409).json({ message: "Product name has already existed" });
        }
        else {
            await database.promise().query(insertProduct_query, [product_name, price, description, image_filename, category_id, availability]);
            return res.status(200).json({ message: "Product added" });
        }
    }
    catch (error) {
        console.error("AddProduct error: ", error);
        fs.unlink(`./uploads/${image_filename}`, err => {
            if (err) {
                console.error("Failed to unlink uploaded file", err);
            }
        });
        return res.status(500).json({ error: error.message });
    }
}

// get all products
const listProducts = async (req, res) => {
    const selectALLProduct_query = `SELECT p.product_id, p.product_name, p.price, p.description, p.image, p.category_id, c.category_name, p.availability 
                                    FROM products p 
                                    JOIN categories c ON p.category_id = c.category_id
                                    ORDER BY category_id`;
    try {
        const [results] = await database.promise().query(selectALLProduct_query);
        return res.status(200).json({ products: results })
    }
    catch (error) {
        console.error("ListProducts error: ", error);
        return res.status(500).json({ error: error.message });
    }
}

// get only available product
const listAvailableProducts = async (req, res) => {
    const selectALLProduct_query = `SELECT p.product_id, p.product_name, p.price, p.description, p.image, p.category_id, c.category_name, p.availability 
                                    FROM products p 
                                    JOIN categories c ON p.category_id = c.category_id
                                    WHERE p.availability = 1`;
    try {
        const [results] = await database.promise().query(selectALLProduct_query);
        return res.status(200).json({ products: results })
    }
    catch (error) {
        console.error("ListProducts error: ", error);
        return res.status(500).json({ error: error.message });
    }
}

// delete a product
const removeProduct = async (req, res) => {
    const select_query = "SELECT * FROM products WHERE product_id = ?";
    const delete_query = "DELETE FROM products WHERE product_id = ?";
    try {
        const [results] = await database.promise().query(select_query, [req.body.product_id]);
        if (results.length <= 0) {
            return res.status(404).json({ message: "Product not found" });
        }
        else {
            await database.promise().query(delete_query, [req.body.product_id]);
            fs.unlink(`uploads/${results[0].image}`, () => {
                console.error("Fail to unlink product image");
            });
            return res.status(200).json({ message: `'${result[0].product_name} (id:${result[0].product_id})' removed` });
        }

    }
    catch (error) {
        console.error("DeleteProduct error: ", error);
        return res.status(500).json({ error: error.message });
    }
}

// update a product
const updateProduct = async (req, res) => {
    const { product_name, price, description, category_id, availability, product_id } = req.body;
    const update_query = "UPDATE products SET product_name = ?, price = ?, description = ?, category_id = ?, availability = ? WHERE product_id = ?";
    try {
        await database.promise().query(update_query, [product_name, price, description, category_id, availability, product_id]);
        return res.status(200).json({ message: "Product updated" });
    }
    catch (error) {
        console.error("UpdateProduct error: ", error);
        return res.status(500).json({ error: error.message });
    }
}

const updateProductImage = async (req, res) => {
    const { old_image_filename, product_id } = req.body;
    let new_image_filename = `${req.file.filename}`;
    const update_query = "UPDATE products SET image = ? WHERE product_id = ?";

    try {
        // Update the database first.
        await database.promise().query(update_query, [new_image_filename, product_id]);

        // if update succeeds, delete the old image.
        fs.unlink(`./uploads/${old_image_filename}`, err => {
            if (err) {
                console.error("Fail to unlink uploaded file: ", err)
            }
        });

        return res.status(200).json({ image: new_image_filename, message: "Product image updated" });

    } catch (error) {
        console.error("Update product image error", error);

        // If the database update failed, we need to clean up the newly uploaded image.
        fs.unlink(`./uploads/${new_image_filename}`, err => {
            if (err) {
                console.error("Fail to unlink uploaded file: ", err)
            }
        });

        console.error(`Failed to unlink uploaded file: `, err);

        return res.status(500).json({ message: "Server error, product image not updated" });
    }
}

export { addProduct, listProducts, listAvailableProducts, removeProduct, updateProduct, updateProductImage }