import React from 'react'
import { Route, Routes } from 'react-router-dom'
import { ToastContainer } from 'react-toastify'
import ScrollToTop from './context/ScrollToTop'
import 'react-toastify/ReactToastify.css'
import DefaultRoute from './components/DefaultRoute/DefaultRoute'
import ProtectedRoute from './components/ProtectedRoute/ProtectedRoute'
import Navbar from './components/Navbar/Navbar'
import SignIn from './pages/SignIn/SignIn'
import Menu from './pages/Menu/Menu'

const App = () => {
    return (
        <div className='app'>
            <ToastContainer />
            <ScrollToTop />
            <Navbar />
            <Routes>
                <Route path='/signIn' element={<SignIn />} />
                <Route path='/menu' element={<Menu />} />

                <Route path="*" element={<DefaultRoute></DefaultRoute>} />
            </Routes>

        </div>
    )
}

export default App
