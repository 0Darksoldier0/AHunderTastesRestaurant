import React from 'react'
import './OnlineOrdersManagement.css'
import { useContext } from 'react'
import { StoreContext } from '../../context/StoreContext'
import { assets } from '../../assets/assets'
import { useState } from 'react'
import OrderDetailsPopup from '../../components/OrderDetailsPopup/OrderDetailsPopup'
import axios from "axios";
import { BACKEND_URL } from '../../../config/constants'
import { toast } from 'react-toastify'

const OnlineOrdersManagement = () => {

    const { token, ordersData} = useContext(StoreContext);
    const [showOrderDetailsPopup, setShowOrderDetailsPopup] = useState(false);
    const [currentOrder, setCurrentOrder] = useState(null);

    const onSelectStatusHandler = async (event, order_id) => {
        const currentStatus = event.target.value;
        try {
            const response = await axios.post(`${BACKEND_URL}/api/order/updateStatus`, { status: currentStatus, order_id: order_id }, { headers: { token } });
            if (response.status === 200) {
                if (currentStatus === "delivered") {
                    window.location.reload();
                }
                toast.success(response.data.message);
            }
        }
        catch (error) {
            if (error.response) {
                toast.error(error.response.data.message);
            }
            else {
                toast.error("Server error, please try again");
            }
        }   
    }

    const onOrderIdClickHandler = (order) => {
        setCurrentOrder({ ...order });
        setShowOrderDetailsPopup(true);
    };

    const closePopupHandler = () => {
        setCurrentOrder(null);
        setShowOrderDetailsPopup(false);
    };

    return (
        <div className='orders'>
            <h1>My Orders</h1>
            <h2>Waiting to be delivered</h2>
            <div className='titles'>
                <p></p>
                <p>OrderID</p>
                <p>Order Date</p>
                <p>Order Status</p>
            </div>
            <div className='order-incomplete-complete'>
                {ordersData.map((order, index) => {
                    if (order.status !== "delivered") {
                        return (
                            <div key={index} className='titles orders-order'>
                                <img src={assets.parcel_icon} alt="" />
                                <p onClick={() => onOrderIdClickHandler(order)} className='order-id'>{order.order_id}</p>
                                <p>{order.order_date.replace('T', ' ').replace('.000Z', '')}</p>
                                <select onChange={(event) => onSelectStatusHandler(event, order.order_id)} className='order-status'>
                                    <option value="preparing">Preparing</option>
                                    <option value="out for delivery">Out For Delivery</option>
                                    <option value="delivered">Delivered</option>
                                </select>
                            </div>
                        )
                    }
                })}
            </div>
            <h2>Completed Orders</h2>
            <div className='order-incomplete-complete'>

                {ordersData.map((order, index) => {
                    if (order.status === "delivered") {
                        return (
                            <div key={index} className='titles orders-order'>
                                <img src={assets.parcel_icon} alt="" />
                                <p onClick={() => onOrderIdClickHandler(order)} className='order-id'>{order.order_id}</p>
                                <p>{order.order_date.replace('T', ' ').replace('.000Z', '')}</p>
                                <p>{order.status}</p>
                            </div>
                        )
                    }
                })}
            </div>
            {showOrderDetailsPopup && currentOrder && (
                <OrderDetailsPopup
                    order={currentOrder}
                    onClose={closePopupHandler}
                    token={token}
                />
            )}
        </div>
    )
}

export default OnlineOrdersManagement
