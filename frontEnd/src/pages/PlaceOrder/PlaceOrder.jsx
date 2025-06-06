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
                    <input type="text" placeholder='First name' />
                    <input type="text" placeholder='Last name' />
                </div>
                <input type="email" placeholder='Email address' />
                <input type="text" placeholder='Street' />
                <div className='multi-fields'>
                    <input type="text" placeholder='City' />
                    <input type="text" placeholder='State' />
                </div>
                <div className='multi-fields'>
                    <input type="text" placeholder='Zip code' />
                    <input type="text" placeholder='Country' />
                </div>
                <input type="text" placeholder='Phone number'/>
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
                    <Link to='/payment'><button>PROCEED TO PAYMENT</button></Link>
                </div>
            </div>
        </form>
    )
}


export default PlaceOrder
