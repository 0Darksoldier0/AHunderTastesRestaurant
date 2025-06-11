import React from 'react'
import './ConfirmPopup.css'

const ConfirmPopup = ({product, onConfirm, onClose}) => {

    console.log(product);

    return (
        <div className='confirm-popup-wrapper' onClick={onClose}>
            <div className='confirm-popup' onClick={e => e.stopPropagation()}>
                <h2>Confirm removing <br /> {product.product_name + ", id: " + product.product_id}? </h2>
                <button className='confirm-btn' onClick={() => onConfirm(product.product_id)}>Confirm</button>
                <button className='cancel-btn' onClick={() => onClose()}>Cancel</button>
            </div>
        </div>
    )
} 


export default ConfirmPopup
