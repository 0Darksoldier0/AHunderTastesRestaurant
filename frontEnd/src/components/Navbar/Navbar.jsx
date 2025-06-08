import React, { useContext, useEffect } from 'react'
import './Navbar.css'
import { assets } from '../../assets/assets'
import {Link, useNavigate} from 'react-router-dom'
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
            <Link to='/' onClick={() => setMenu("Home")}><div className='logo'>
                <img src="" alt="logo" />
                <p>A Hundred Tastes</p>
            </div></Link>
            <ul className='navbar-menu'>
                <Link to='/' onClick={() => setMenu("Home")} className={menu === "Home" ? "active" : "inactive"}>Home</Link>
                <Link to='/aboutUs' onClick={() => setMenu("About Us")} className={menu === "About Us" ? "active" : "inactive"}>About Us</Link>
                <Link to='/menu' onClick={() => setMenu("Menu")} className={menu === "Menu" ? "active" : "inactive"}>Menu</Link>
            </ul>
            <div className="navbar-right">
                <div className="navbar-basket-icon">
                    <Link to='/cart' onClick={() => setMenu("")}><img src={assets.basket_icon} alt="" /></Link>
                    <div className={getCartTotalAmount() ? "dot" : ""}></div>
                </div>
                {!token 
                    ?   <Link to='/signin' onClick={() => setMenu("")} ><button>Sign In</button></Link>
                    :   <div className='navbar-profile'>
                            <img src={assets.profile_icon} alt="" />
                            <ul className='navbar-profile-dropdown'>
                                <Link to='/orders' onClick={onOrderClickHandler}><p>Orders</p></Link>
                                <hr />
                                <Link to='/account' onClick={onAccountClickHandler}><p>Account</p></Link>
                                <hr />
                                <Link to='/' onClick={onSignOutClickHandler} className='signout'><p>Sign Out</p></Link>
                            </ul>
                        </div>
                }
                
            </div>
        </div>
    )
}


export default Navbar