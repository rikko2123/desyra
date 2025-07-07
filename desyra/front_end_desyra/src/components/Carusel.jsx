import React, { useEffect, useState } from 'react'
import CaruselSlider from './CaruselSlider'
import Button from '@mui/material/Button'
import { Link } from 'react-router-dom'
import '../style/carusel.css'

const btn_style = {
    border:'none', 
    borderRadius: '0', 
    backgroundColor: 'rgba(0, 0, 0, 0.4)',
    '&:hover': {
        backgroundColor: 'rgba(0, 0, 0, 0.6)',
    },
    maxWidth: '200px',
    padding: '13px',
}


function Carusel() {

    const [brand, setBrand] = useState([])


    
    useEffect(() => {
        fetch('http://127.0.0.1:8000/api/brand-product/')
        .then(response => response.json())
        .then(data => setBrand(data))
    }, [])


    return (
        <section className='carusel-sec'>
            <div className="text-block">
                <span>{brand[1]?.name}</span>
            </div>

            <div className="slider-box">
                <CaruselSlider data = {brand} brand = {brand[1]?.name}/>
            </div>

            <div className="btn-b">
                <Button variant="outlined" sx={btn_style}><Link to='/' style={{color: 'white'}}>SHOP NOW</Link></Button>
            </div>
        </section>
    )
}

export default Carusel
