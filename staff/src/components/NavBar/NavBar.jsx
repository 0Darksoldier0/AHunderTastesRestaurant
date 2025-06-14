import React, { useContext } from 'react'
import './Navbar.css'
import { Link, useNavigate } from 'react-router-dom'
import { StoreContext } from '../../context/StoreContext'
import { assets } from '../../assets/assets'

const Navbar = () => {

    const navigate = useNavigate();

    const { token, setToken, menu } = useContext(StoreContext);

    const onSignOutClickHandler = () => {
        setToken("");   
        localStorage.removeItem("token");
        navigate('/signIn'); 
        window.location.reload();
    }

    return (
        <div className='navbar'>
            <Link to={!token ? '/signIn' : '/'}><div className='logo'>
                <img src={assets.restaurant_logo} alt="logo" />
                <p>A Hundred Tastes</p>
            </div></Link>
            {
                token
                    ? <>
                        <ul className='navbar-menu'>
                            <Link to='/menu' className={menu === "Menu" ? "active" : "inactive"}>Menu</Link>
                        </ul>
                        <div className="navbar-right">
                            <button onClick={onSignOutClickHandler}>Sign Out</button>
                        </div></>
                    : <></>
            }

        </div>
    )
}


export default Navbar