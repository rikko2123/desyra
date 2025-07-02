import React, { useState } from 'react'
import { Link } from 'react-router-dom'
import Logo from '../assets/logo_desyra.png'
import '../style/navbar.css'
import MobileMenu from './MobileMenu'
import SearchIcon from '@mui/icons-material/Search';
import ShoppingBagIcon from '@mui/icons-material/ShoppingBag';

function NavBar() {

    const nav_element=[
        {type: 'link', label: 'Shop', href: '/shop'},
        {type: 'link', label: 'About us', href: '/about-us'},
        {type: 'img',  src: Logo, href: '/'},
        {type: 'link', label: 'Search', href: '/search', logo: <SearchIcon sx={{color:'black'}}/>},
        {type: 'link', label: 'Account', href: '/account', },
        {type: 'link', label: 'Wishlist', href: '/wishlist'},
        {type: 'link', label: 'Chart', href: '/chart', logo: <ShoppingBagIcon sx={{color:'black'}}/>},
    ]

    return (
        <nav style={{display:'flex', width:'100%', height:'4.5rem'}} className='nav-style'>

            {/* menu mobile */}
            <MobileMenu nav_elements = {nav_element}/>

            {/* menu desktop */}
            <ul className='nav-style-left'>
                {/* slice() è un metodo degli array JavaScript che serve per estrarre una porzione dell’array, senza modificarlo. */}
                {nav_element?.slice(0, 2).map((nav_item, index) => (
                    <li key={index}>
                        
                        <Link to={nav_item.href} className='nav-link'>{nav_item.label}</Link>
                    </li> 
            
                ))}                
            </ul>

            <div className="logo-img" style={{width:'30%', height:'100%'}}>
                <Link to={nav_element[2].href} 
                    style={{width:'70%', height:'100%', display:'flex', alignItems: 'center', justifyContent:'center'}}
                >
                    <img src={nav_element[2].src} alt='logo' loading='lazy'/>
                </Link>
            </div>

            <ul className='nav-style-rigth'>
                {/* slice() è un metodo degli array JavaScript che serve per estrarre una porzione dell’array, senza modificarlo. */}
                {nav_element?.slice(3).map((nav_item, index) => (
                    <li key={index}>
                        <Link to={nav_item.href} className='nav-link'>{nav_item.label}</Link>
                    </li> 
                ))}                
            </ul>


        </nav>
    )
}

export default NavBar
