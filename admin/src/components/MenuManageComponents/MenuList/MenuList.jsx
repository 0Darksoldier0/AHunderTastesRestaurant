import React, { useContext, useEffect, useState } from 'react'
import './MenuList.css'
import axios from 'axios'
import { BACKEND_URL } from '../../../config/constants'
import { toast } from 'react-toastify'
import { NavLink } from 'react-router-dom'
import EditPopup from '../../EditPopUp/EditPopUp'
import { StoreContext } from '../../../context/StoreContext'

const MenuList = () => {
    const { foodList, fetchFoodList } = useContext(StoreContext);
    const [showEditPopup, setShowEditPopup] = useState(false);
    const [currentProduct, setCurrentProduct] = useState(null); // State to store the product being edited
    const [image, setImage] = useState(false);

    useEffect(() => {
        fetchFoodList()
    }, [])

    const mapCategoryIdToName = (id) => {
        switch (id) {
            case 10: return 'Appertizer';
            case 11: return 'Main Dishes';
            case 12: return 'Drinks';
            case 13: return 'Desserts';
        }
    }

    const removeProduct = async (product_id) => {
        const response = await axios.post(`${BACKEND_URL}/api/product/remove`, { product_id: product_id });
        await fetchFoodList();

        if (response.status === 200) {
            toast.success(response.data.message);
        }
        else {
            toast.error(response.data.message)
        }
    }

    const onClickEditHandler = (product) => {
        // Ensure availability is a boolean for the checkbox
        setCurrentProduct({ ...product });
        setShowEditPopup(true);
    };

    const handleClosePopup = () => {
        setShowEditPopup(false);
        setCurrentProduct(null);
    };

    const onUpdateSuccessHandler = () => {
        fetchFoodList(); // Re-fetch products after a successful update
    };

    const onSaveImageClickHandler = async (item) => {
        const formData = new FormData();
        formData.append("image", image);
        formData.append("old_image_filename", item.image);
        formData.append("product_id", item.product_id);

        try {
                const response = await axios.post(`${BACKEND_URL}/api/product/updateimage`, formData);
                if (response.status === 200) {
                    fetchFoodList()
                    setImage(false);
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

    return (
        <div className='menu-list'>
            <div className='top-section'>
                <h1>Menu Items List</h1>
                <div>
                    <NavLink to='/menuManagement/addProduct'><button>Add Product</button></NavLink>
                    <input type="text" placeholder='Search' />
                </div>
            </div>
            <div className='list-table'>
                <div className="title">
                    <b>Product Image</b>
                    <b>Product Code</b>
                    <b>Product Name</b>
                    <b>Category</b>
                    <b>Price</b>
                    <b>Availability</b>
                    <b>Actions</b>
                </div>

                {foodList.map((item, index) => {
                    return (
                        <div className='list-table-format' key={index}>
                            <div>
                                {
                                    !image
                                        ? <img className='image-preview' src={`${BACKEND_URL}/images/` + item.image} alt="" />
                                        : <img src={image ? URL.createObjectURL(image) : assets.upload_area} alt="" />
                                }
                                <div className='image-change'>
                                    {
                                        !image
                                            ? <>
                                                <label className='change-cancel' htmlFor="image">Change</label>
                                                <input onChange={(event) => setImage(event.target.files[0])} type="file" id='image' hidden required />
                                            </>
                                            : <label className='change-cancel' onClick={() => setImage(false)}>Clear</label>
                                    }
                                    {image ? <label onClick={() => onSaveImageClickHandler(item)} className='save'>Save</label> : <></>}
                                </div>
                            </div>
                            <p>{item.product_id}</p>
                            <p>{item.product_name}</p>
                            <p>{mapCategoryIdToName(item.category_id)}</p>
                            <p>{item.price}</p>
                            <p>{item.availability ? 'Available' : 'Unavailable'}</p>
                            <div className='actions'>
                                <p onClick={() => onClickEditHandler(item)}>edit</p>
                                <p onClick={() => removeProduct(item.product_id)}>remove</p>
                            </div>
                        </div>
                    )
                })}
            </div>
            {showEditPopup && currentProduct && (
                <EditPopup
                    product={currentProduct}
                    onClose={handleClosePopup}
                    onUpdateSuccess={onUpdateSuccessHandler}
                />
            )}
        </div>
    )
}

export default MenuList
