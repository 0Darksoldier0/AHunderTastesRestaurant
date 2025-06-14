import React from 'react'
import { Route, Routes } from 'react-router-dom'
import { ToastContainer } from 'react-toastify'
import ScrollToTop from './context/ScrollToTop'
import 'react-toastify/ReactToastify.css'
import Navbar from './components/NavBar/NavBar'

const App = () => {
    return (
        <div className='app'>
            <ToastContainer />
            <ScrollToTop />
            <Navbar />
            <Routes>

            </Routes>

        </div>
    )
}

export default App
