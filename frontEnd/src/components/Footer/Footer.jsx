import React from 'react'
import './Footer.css'
import footer1 from '../../assets/footer1.png'
import footer2 from '../../assets/footer2.png'
import footer3 from '../../assets/footer3.png'
import footer4 from '../../assets/footer4.png'

const Footer = () => {
    return (
        <div className='footer'>
            <div className='footer-main'>

                <div className='footer-left'>
                    <div className='logo'>
                        <img src="" alt="hundredtaste logo" />
                        <h2>A Hundred Tastes</h2>
                    </div>
                    <p>In the new era of technology we look in the future with certainty and pride to our company</p>
                    <img src="" alt="facebook-logo" />
                    <img src="" alt="instagram logo" />
                    <img src="" alt="twitter logo" />
                    <img src="" alt="tiktok logo" />
                </div>

                <div className="footer-middle">
                    <h2>Contact</h2>
                    <img src="" alt="phone logo" />
                    <p>0123-456-789</p>
                    <br />
                    <img src="" alt="email logo" />
                    <p>ahundredtastes@gmail.com</p>
                    <br />
                    <img src="" alt="address logo" />
                    <p>hundred taste address</p>
                </div>

                <div className="footer-right">
                    <h2>Follow us on Instagram</h2>
                    <img src={footer1} alt="" />
                    <img src={footer2} alt="" />
                    <br />
                    <img src={footer3} alt="" />
                    <img src={footer4} alt="" />
                </div>
            </div>
            <p className='copyright'>Copyright &copy; 2023 Hastag Developer. All Rights Reserved</p>
        </div>

    )
}

export default Footer
