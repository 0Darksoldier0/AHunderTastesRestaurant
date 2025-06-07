import React, { useState, useEffect, useContext } from 'react'
import Navbar from './components/Navbar/Navbar'
import { Route, Routes } from 'react-router-dom'
import Home from './pages/Home/Home'
import AboutUs from './pages/AboutUs/AboutUs'
import Menu from './pages/Menu/Menu'
import Cart from './pages/Cart/Cart'
import PlaceOrder from './pages/PlaceOrder/PlaceOrder'
import Footer from './components/Footer/Footer'
import ScrollToTop from './context/ScrollToTop'
import SignIn from './pages/SignIn/SignIn'
import SignUp from './pages/SignUp/SignUp'
import ProtectedRoute from './components/ProtectedRoute/ProtectedRoute'
import DefaultRoute from './components/DefaultRoute/DefaultRoute'
import { ToastContainer } from 'react-toastify'
import 'react-toastify/ReactToastify.css'
import { StoreContext } from './context/StoreContext'
import Account from './pages/Account/Account'
import ProtectedAndCheckCartAmountRoute from './components/ProtectedAndCheckCartRoute/ProtectedAndCheckCartAmountRoute'

const App = () => {

    const {menu, setMenu} = useContext(StoreContext);

    return (
        <div className='app'>
            <ToastContainer />
            <ScrollToTop />
            <Navbar menu={menu} setMenu={setMenu} />
            <Routes>
                <Route path='/' element={<Home setMenu={setMenu} />} />
                <Route path='/aboutUs' element={<AboutUs />} />
                <Route path='/menu' element={<Menu />} />
                <Route path='/cart' element={<Cart />} />
                <Route path='/signIn' element={<SignIn setMenu={setMenu} />} />
                <Route path='/signUp' element={<SignUp />} />
                <Route path='/account' element={<ProtectedRoute><Account /></ProtectedRoute>} />
                <Route path='/placeOrder' element={<ProtectedAndCheckCartAmountRoute><PlaceOrder /></ProtectedAndCheckCartAmountRoute>} />
               
                <Route path="*" element={<ProtectedRoute></ProtectedRoute>} />
                <Route path="*" element={<DefaultRoute></DefaultRoute>} />
            </Routes>
            <Footer />
        </div>
    )
}

export default App