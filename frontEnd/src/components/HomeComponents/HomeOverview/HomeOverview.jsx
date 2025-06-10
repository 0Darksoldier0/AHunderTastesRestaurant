import React from 'react'
import './HomeOverview.css'
import {Link} from 'react-router-dom'
import { useNavigate } from 'react-router-dom';

const HomeOverview = () => {

    const navigate = useNavigate();

    const handleExploreMenu = () => {
        navigate('/menu'); // Navigate to the Home page
    };

    return (
        <div className='overview'>
            <h1>Browse Our Menu</h1>
            <div className='overview-sections'>
                <div className="sub-section">
                    <img src="" alt="breakfast -icon" />
                    <h2>Breakfast</h2>
                    <p>An overview of the breakfast menu</p>
                    <h3 onClick={handleExploreMenu}>Explore Menu</h3>
                </div>
                <div className="sub-section">
                    <img src="" alt="breakfast -icon" />
                    <h2>Main Dishes</h2>
                    <p>An overview of the main dishes menu</p>
                    <h3 onClick={handleExploreMenu}>Explore Menu</h3>
                </div>
                <div className="sub-section">
                    <img src="" alt="breakfast -icon" />
                    <h2>Drinks</h2>
                    <p>An overview of the drink menu</p>
                    <h3 onClick={handleExploreMenu}>Explore Menu</h3>
                </div>
                <div className="sub-section">
                    <img src="" alt="breakfast -icon" />
                    <h2>Dessert</h2>
                    <p>An overview of the dessert menu</p>
                    <h3 onClick={handleExploreMenu}>Explore Menu</h3>
                </div>
            </div>
        </div>
    )
}

export default HomeOverview
