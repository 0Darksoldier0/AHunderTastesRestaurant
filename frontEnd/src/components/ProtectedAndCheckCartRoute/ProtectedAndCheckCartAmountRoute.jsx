import React, { useContext } from 'react';
import { Navigate } from 'react-router-dom';
import { StoreContext } from '../../context/StoreContext';

const ProtectedAndCheckCartAmountRoute = ({ children }) => {
    
    const {getCartTotalAmount} = useContext(StoreContext);
    const token = localStorage.getItem('token');
    
    if (token) {
        if (!getCartTotalAmount()) {
            return <Navigate to="/" replace />;
        }
    }

    return children;
};

export default ProtectedAndCheckCartAmountRoute;