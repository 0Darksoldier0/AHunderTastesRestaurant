import React, { useEffect } from 'react'
import './VerifyOrder.css'
import { useNavigate, useSearchParams } from 'react-router-dom'
import { BACKEND_URL } from '../../../config/constants'
import axios from 'axios'

const VerifyOrder = () => {
    const [searchParams, setSearchParams] = useSearchParams();
    const success = searchParams.get("success");
    const order_id = searchParams.get("order_id");
    const navigate = useNavigate();

    const verifyOrderPayment = async () => {
        const response = await axios.post(`${BACKEND_URL}/api/order/verifyOrder`, {success, order_id});
        if (response.data.success) {
            navigate("/orders")
        }
        else {
            navigate("/");
        }
    }

    useEffect(() => {
        verifyOrderPayment();
    }, [])

    return (
        <div className='verify'>
            <div className="spinner">

            </div>
        </div>
    )
}

export default VerifyOrder
