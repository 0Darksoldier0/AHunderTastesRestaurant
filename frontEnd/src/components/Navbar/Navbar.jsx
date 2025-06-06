import React, { useContext, useEffect } from 'react'
import './Navbar.css'
import { assets } from '../../assets/assets'
import {NavLink, useNavigate} from 'react-router-dom'
import { StoreContext } from '../../context/StoreContext'

const Navbar = ({menu, setMenu}) => {

    const navigate = useNavigate();

    const {getCartTotalAmount, token, setToken} = useContext(StoreContext);

    const onSignOutClickHandler = () => {
        localStorage.removeItem("token");
        setToken("");
        setMenu("Home");
        navigate('/');
        window.location.reload();
    }

    const onAccountClickHandler = () => {
        navigate('/account');
        setMenu("");
    }

    const onOrderClickHandler = () => {
        navigate('/orders');
        setMenu("");
    }

    return (
        <div className='navbar'>
            <NavLink to='/' onClick={() => setMenu("Home")}><div className='logo'>
                <img src="" alt="logo" />
                <p>A Hundred Tastes</p>
            </div></NavLink>
            <ul className='navbar-menu'>
                <NavLink to='/' onClick={() => setMenu("Home")} className={menu === "Home" ? "active" : "inactive"}>Home</NavLink>
                <NavLink to='/aboutUs' onClick={() => setMenu("About Us")} className={menu === "About Us" ? "active" : "inactive"}>About Us</NavLink>
                <NavLink to='/menu' onClick={() => setMenu("Menu")} className={menu === "Menu" ? "active" : "inactive"}>Menu</NavLink>
            </ul>
            <div className="navbar-right">
                <div className="navbar-basket-icon">
                    <NavLink to='/cart' onClick={() => setMenu("")}><img src={assets.basket_icon} alt="" /></NavLink>
                    <div className={getCartTotalAmount() ? "dot" : ""}></div>
                </div>
                {!token 
                    ?   <NavLink to='/signin' onClick={() => setMenu("")} ><button>Sign In</button></NavLink>
                    :   <div className='navbar-profile'>
                            <img src={assets.profile_icon} alt="" />
                            <ul className='navbar-profile-dropdown'>
                                <NavLink to='/orders' onClick={onOrderClickHandler}><p>Orders</p></NavLink>
                                <hr />
                                <NavLink to='/account' onClick={onAccountClickHandler}><p>Account</p></NavLink>
                                <hr />
                                <NavLink to='/' onClick={onSignOutClickHandler} className='signout'><p>Sign Out</p></NavLink>
                            </ul>
                        </div>
                }
                
            </div>
        </div>
    )
}


export default Navbar
