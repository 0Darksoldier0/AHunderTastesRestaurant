import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { BACKEND_URL } from '../../config/constants.js';
import { toast } from 'react-toastify';
import './EditPopup.css';
import { useContext } from 'react';
import { StoreContext } from '../../context/StoreContext.jsx';

const EditPopup = ({ product, onClose, onUpdateSuccess }) => {
    const { token } = useContext(StoreContext);
    
    const [editedProductData, setEditedProductData] = useState({
        product_id: product.product_id,
        product_name: product.product_name,
        price: product.price,
        description: product.description,
        category_id: product.category_id,
        availability: product.availability
    });
    const [isAvailable, setIsAvailable] = useState(product.availability ? true : false)

    const categories = [
        { category_id: 10, category_name: 'Appertizer' },
        { category_id: 11, category_name: 'Main Dishes' },
        { category_id: 12, category_name: 'Drinks' },
        { category_id: 13, category_name: 'Desserts' },
    ];

    useEffect(() => {
        setEditedProductData(editedProductData);
    }, [editedProductData]);

    useEffect(() => {
        console.log(editedProductData)
    }, [editedProductData])

    const onChangeHandler = (event) => {
        const { name, value, type, files } = event.target;

        if (name === 'availability') {
            setIsAvailable(event.target.checked);
            setEditedProductData(data => ({ ...data, [name]: event.target.checked ? 1 : 0 }));

        } else {
            setEditedProductData(prev => ({
                ...prev,
                [name]: type === 'file' ? files[0] : value
            }));
        }
    };

    const onSubmitHandler = async (e) => {
        e.preventDefault();
        if (editedProductData.product_name === "" || editedProductData.price === 0 || editedProductData.description === "") {
            toast.error("No empty field is allowed");
        }

        else {

            try {
                const response = await axios.post(`${BACKEND_URL}/api/product/update`, editedProductData, {headers: {token}});
                if (response.status === 200) {
                    onUpdateSuccess();
                    toast.success(response.data.message)
                } else {
                    toast.error(response.data.message || "Failed to add product.");

                }
            } catch (error) {
                if (error.response) {
                    if (error.response.data.message === "Product name has already existed") {
                        toast.error("Product name has already existed");
                    }
                }
                else {
                    toast.error("Server error, please try again later");
                }

            }
        }
    };

    return (
        <div className="edit-popup-container">
            <div className="edit-popup">
                <h1>Edit Product</h1>
                <form onSubmit={onSubmitHandler}>
                    <div className="form-group">
                        <label>Product Name</label>
                        <input type="text" name="product_name" value={editedProductData.product_name || ''} onChange={onChangeHandler} required />
                    </div>
                    <div className="form-group">
                        <label>Price</label>
                        <input type="number" name="price" value={editedProductData.price || ''} onChange={onChangeHandler} required />
                    </div>
                    <div className="form-group">
                        <label>Category</label>
                        <select name="category_id" value={editedProductData.category_id || ''} onChange={onChangeHandler} required>
                            <option value="">Select a category</option>
                            {categories.map((category) => (
                                <option key={category.category_id} value={category.category_id}>{category.category_name}</option>
                            ))}
                        </select>
                    </div>
                    <div className="form-group">
                        <label>Description</label>
                        <textarea name="description" value={editedProductData.description || ''} onChange={onChangeHandler} rows="4"></textarea>
                    </div>
                    <div className="add-availability">
                        <p>Availability</p>
                        <label className="switch">
                            <input onChange={onChangeHandler} name='availability' type="checkbox" checked={isAvailable} />
                            <span className="slider round"></span>
                        </label>
                    </div>
                    <div className='buttons'>
                        <button className='save-change-btn' type="submit">Save Changes</button>
                        <button onClick={onClose} className='cancel-btn' type='button'>Return</button>
                    </div>

                </form>
            </div>
        </div>
    );
};

export default EditPopup;