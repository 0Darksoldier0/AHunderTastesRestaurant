import React from 'react'
import { Navigate } from 'react-router-dom';

const DefaultRoute = () => {
    const token = localStorage.getItem('token');

    if (token) {
        return <Navigate to="/" replace />;
    }

    return children;
}

export default DefaultRoute
