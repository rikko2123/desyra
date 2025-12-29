import React, { useState } from 'react'
import Hamburger from 'hamburger-react'
import { Link } from 'react-router-dom'
import '../style/mobilemenu.css'

function MobileMenu({nav_elements}) {

    const [isOpen, setIsOpen] = useState(false)

    return (
        <div className="nav-mobile">
            {/* sezione hamburgher menu */}
            <div className="ham-menu-box">
                <div className="hamburger-wrapper">
                    <Hamburger
                        toggled={isOpen} toggle={setIsOpen} size={20}
                    />
                </div>

                {isOpen? 
                    <ul className="dropdown-menu">
                        {nav_elements
                        .filter(item => item.type !== 'img' && item.label !== 'Search' && item.label !== 'Chart')
                        .map((item, index) => (
                            <li key={index}>
                                <Link to={item.href} onClick={() => setIsOpen(false)}>
                                    {item.label}
                                </Link>
                            </li>
                        ))}
                    </ul>    
                : ''}
            </div>

            <div className="logo-img-mobile" style={{width:'30%', height:'100%'}}>
                <Link to={nav_elements[2].href} 
                    style={{width:'70%', height:'100%', display:'flex', alignItems: 'center', justifyContent:'center'}}
                >
                    <img src={nav_elements[2].src} alt='logo' loading='lazy'/>
                </Link>
            </div>
            
            <ul className='nav-style-rigth-mobile'>
                {/* slice() è un metodo degli array JavaScript che serve per estrarre una porzione dell’array, senza modificarlo. */}
                {nav_elements.filter(nav_item => nav_item.label === 'Search' || nav_item.label === 'Chart').map((nav_item, index) => (
                    <li key={index}>
                        <Link to={nav_item.href} className='nav-link-mobile'>{nav_item.logo}</Link>
                    </li> 
                ))}                
            </ul>
        </div>
    )
}

export default MobileMenu
