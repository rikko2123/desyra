import React from 'react'
import { Link } from 'react-router-dom'
import Logo from '../assets/logo.png'

const nav_element=[
    {type: 'link', label: 'Shop', href: '/shop'},
    {type: 'link', label: 'About us', href: '/about-us'},
    {type: 'img',  src: Logo, href: '/'},
    {type: 'link', label: 'Search', href: '/search'},
    {type: 'link', label: 'Account', href: '/account'},
    {type: 'link', label: 'Wishlist', href: '/wishlist'},
    {type: 'link', label: 'Chart', href: '/chart'},

]

function NavBar() {
    return (
        <nav style={{display:'flex', width:'100%', border:'1px solid red'}}>
            <ul style={
                    {
                        display:'flex', 
                        listStyleType: 'none',
                        color:'black',
                        alignItems:'center',
                        justifyContent:'space-between',
                        border: '1px solid red',
                        width: '100%'
                    }
                }
            >


                {nav_element.map((nav_item, index) => (
                    <li key={index}>
                        {
                            nav_item.type == 'link' ? 
                                <Link to={nav_item.href}>{nav_item.label}</Link>
                            : 
                                <img src={nav_item.src} alt="Logo" style={{ height: '30px' }} />
                        }
                    </li> 
                ))}
            </ul>
        </nav>
    )
}

export default NavBar
