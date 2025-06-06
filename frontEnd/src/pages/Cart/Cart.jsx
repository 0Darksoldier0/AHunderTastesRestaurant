import React, { useContext } from 'react'
import './Cart.css'
import { StoreContext } from '../../context/StoreContext'
import { assets } from '../../assets/assets';
import { useNavigate } from 'react-router-dom';
import { toast } from 'react-toastify';

import { BACKEND_URL } from '../../../config/constants';

const Cart = () => {

    const token = localStorage.getItem('token');
    const { food_list, cartItems, addToCart, removeFromCart, getCartTotalAmount} = useContext(StoreContext);
    const deliveryFee = 35000;
    const navigate = useNavigate();

    const processToCheckOutHandler = () => {
        if (getCartTotalAmount() > 0) {
            navigate('/placeOrder');
        }
        else {
            toast.error('No Items In Cart');
        }
    }

    return (
        <div className='cart'>
            <div className="cart-items">
                <div className="cart-items-title">
                    <p></p>
                    <p>Name</p>
                    <p>Price</p>
                    <p>Quantity</p>
                    <p>Total</p>
                </div>
                <br />
                <hr />
                {food_list.map((item, index) => {
                    if (cartItems[item.product_id] > 0) {
                        return (
                            <div>
                                <div className='cart-items-title cart-items-item'>
                                    <img className='food' src={`${BACKEND_URL}` + "/images/" + item.image} alt="" />
                                    <p>{item.product_name}</p>
                                    <p>{item.price}</p>
                                    <div id='food-item-counter' >
                                        <img onClick={() => removeFromCart(item.product_id)} src={assets.remove_icon_red} alt="" />
                                        <p>{cartItems[item.product_id]}</p>
                                        <img onClick={() => addToCart(item.product_id)} src={assets.add_icon_green} alt="" />
                                    </div>
                                    <p>{item.price * cartItems[item.product_id]} vnd</p>
                                </div>
                                <hr />
                            </div>
                        )
                    }
                })}
            </div>
            <div className="cart-bottom">
                <div className='cart-total'>
                    <h2>Cart Totals</h2>
                    <div>
                        <div className="cart-total-detals">
                            <p>Subtotal</p>
                            <p>{getCartTotalAmount()} vnd</p>
                        </div>
                        <hr />
                        <div className="cart-total-detals">
                            <p>Delivery Fee</p>
                            <p>{getCartTotalAmount() ? deliveryFee : 0}</p>
                        </div>
                        <hr />
                        <div className="cart-total-detals">
                            <b>Total</b>
                            <b>{getCartTotalAmount() ? getCartTotalAmount() + deliveryFee : 0} vnd</b>
                        </div>
                    </div>
                    <button onClick={() => token ? processToCheckOutHandler() : toast.error("Please sign in")}>PROCEED TO CHECKOUT</button>
                </div>
            </div>
        </div>
    )
}

export default Cart
