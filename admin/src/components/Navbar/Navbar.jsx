import React, { useContext } from 'react'
import './Navbar.css'
import { Link, NavLink, useNavigate } from 'react-router-dom'
import { StoreContext } from '../../context/StoreContext'

const Navbar = () => {

    const navigate = useNavigate();

    const { token, setToken, menu, setMenu } = useContext(StoreContext);

    const onSignOutClickHandler = () => {
        setMenu("");
        setToken("");
        navigate('/signIn');
        localStorage.removeItem("token");
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

                            <Link to='/' onClick={() => setMenu("Dashboard")} className={menu === "Dashboard" ? "active" : "inactive"}>Dashboard</Link>
                            <Link to='/menuManagement' onClick={() => setMenu("Manage Menu")} className={menu === "Manage Menu" ? "active" : "inactive"}>Manage Menu</Link>
                            <Link to='/ordersManagement' onClick={() => setMenu("Manage Orders")} className={menu === "Manage Orders" ? "active" : "inactive"}>Manage Orders</Link>
                            <Link to='/onlineOrdersManagement' onClick={() => setMenu("Manage Online Orders")} className={menu === "Manage Online Orders" ? "active" : "inactive"}>Manage Online Orders</Link>
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
