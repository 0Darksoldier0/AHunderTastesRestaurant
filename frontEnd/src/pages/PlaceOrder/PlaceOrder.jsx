import React, { useContext } from 'react'
import './PlaceOrder.css'
import { StoreContext } from '../../context/StoreContext'
import { Link } from 'react-router-dom'

const PlaceOrder = () => {

    const {getCartTotalAmount} = useContext(StoreContext);
    const deliveryFee = 4;
    
    return (
        <form className='place-order'>  
            <div className="place-order-left">
                <p className='title'>Delivery Information</p>
                <div className='multi-fields'>
                    <input type="text" placeholder='First name' required />
                    <input type="text" placeholder='Last name' required />
                </div>
                <input type="email" placeholder='Email address' />
                <input type="text" placeholder='Street' />
                <div className='multi-fields'>
                    <input type="text" placeholder='City' required />
                    <input type="text" placeholder='State' required />
                </div>
                <div className='multi-fields'>
                    <input type="text" placeholder='Zip code' required />
                    <input type="text" placeholder='Country' required />
                </div>
                <input type="text" placeholder='Phone number'required />
            </div>
            <div className="place-order-right">
                <div className='cart-total'>
                    <h2>Cart Totals</h2>
                    <div>
                        <div className="cart-total-detals">
                            <p>Subtotal</p>
                            <p>${getCartTotalAmount()}</p>
                        </div>
                        <hr />
                        <div className="cart-total-detals">
                            <p>Delivery Fee</p>
                            <p>{getCartTotalAmount() ? deliveryFee : 0}</p>
                        </div>
                        <hr />
                        <div className="cart-total-detals">
                            <b>Total</b>
                            <b>${getCartTotalAmount() ? getCartTotalAmount() + deliveryFee : 0}</b>
                        </div>
                    </div>
                    <button type='submit'>PROCEED TO PAYMENT</button>
                </div>
            </div>
        </form>
    )
}


export default PlaceOrder
