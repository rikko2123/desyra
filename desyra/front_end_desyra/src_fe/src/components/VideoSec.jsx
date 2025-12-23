import React, { useEffect, useState } from 'react'
import { data } from 'react-router-dom'
import Button from '@mui/material/Button';
import { Link } from 'react-router-dom';
import '../style/hero.css'
import Video from '../assets/video.mp4'

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

//! IMPOSTA CAMBIO DI STATO PER UTENTE REGISTRATO OPPURE UTENTE NON REGISTRATO


function VideoSec() {
    // creo stato per il titolo e desc della hero

    const [text, setText] = useState('Registrati per ottenere un buono sconto')

    useEffect(() => {
        fetch('INSERISCI END POINT API USER')
    })

    return (
        <section className='video-hero'>
            <div className="video-box">
                <video controls preload="none" autoPlay muted loop >
                    <source src={Video} type="video/mp4" />
                </video>
            </div> 

            {/* <div className="overlay">
                {titleData[0]?.name == 'jewellery' ? 
                    
                    <div className="hero-text-box">
                        <div className="text">
                            <h1>{titleData[0].name}</h1> 
                            <span>{titleData[0].short_desc}</span>
                        </div>
                        <Button variant="outlined" sx={btn_style}><Link to='/' style={{color: 'white'}}>SING IN</Link></Button>
                    </div>

                : <h1>No result</h1>}
            </div>     */}

            <div className="overlay">
                    
                <div className="video-text-box">
                    <div className="video-text">
                        <h1>UNISCITI A NOI</h1> 
                        <span>{text}</span>
                    </div>
                    <Button variant="outlined" sx={btn_style}><Link to='/' style={{color: 'white'}}>SING IN</Link></Button>
                </div>
            </div>  
                       
        </section>
    )
}

export default VideoSec