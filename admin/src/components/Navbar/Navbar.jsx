import React, { useContext } from 'react'
import './Navbar.css'
import { Link, NavLink, useNavigate } from 'react-router-dom'
import { StoreContext } from '../../context/StoreContext'

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
            <Link to={!token ? '/signIn' : '/'} onClick={() => setMenu("Dashboard")}><div className='logo'>
                <img src="" alt="logo" />
                <p>A Hundred Tastes</p>
            </div></Link>
            {
                token
                    ? <>
                        <ul className='navbar-menu'>

                            <Link to='/' className={menu === "Dashboard" ? "active" : "inactive"}>Dashboard</Link>
                            <Link to='/menuManagement' className={menu === "Manage Menu" ? "active" : "inactive"}>Manage Menu</Link>
                            <Link to='/onlineOrdersManagement' className={menu === "Manage Online Orders" ? "active" : "inactive"}>Manage Online Orders</Link>
                            <Link to='/ordersManagement' className={menu === "Manage Orders" ? "active" : "inactive"}>Manage Orders</Link>
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