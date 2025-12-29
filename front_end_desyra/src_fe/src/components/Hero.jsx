import React, { useEffect, useState } from 'react'
import { data } from 'react-router-dom'
import Button from '@mui/material/Button';
import { Link } from 'react-router-dom';
import '../style/hero.css'
import Heroimg from '../assets/hero_p.jpg'

const btn_style = {
    border:'none', 
    borderRadius: '0', 
    backgroundColor: 'rgba(0, 0, 0, 0.4)',
    '&:hover': {
        backgroundColor: 'rgba(0, 0, 0, 0.6)',
    },
    maxWidth: '200px',
    padding: '13px'
}


function Hero() {
    // creo stato per il titolo e desc della hero

    const [titleData, setTitleData] = useState('')


    useEffect(() => {
        fetch('http://localhost/api/category/')
        .then(response => response.json())
        .then(data => setTitleData(data))
    }, [])

    return (
        <section className='hero'>

            <div className="img-box">
                <img src={Heroimg} alt="hero" />
            </div> 

            <div className="overlay">
                {titleData[0]?.name == 'jewellery' ? 
                    
                    <div className="hero-text-box">
                        <div className="text">
                            <h1>{titleData[0].name}</h1> 
                            <span>{titleData[0].short_desc}</span>
                        </div>
                        <Button variant="outlined" sx={btn_style}><Link to='/' style={{color: 'white'}}>SHOP NOW</Link></Button>
                    </div>

                : <h1>No result</h1>}
            </div>    
                       
        </section>
    )
}

export default Hero
