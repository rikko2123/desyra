import React, { useState, useRef, useEffect } from 'react'
import '../style/hero.css'
import Video2 from '../assets/videohome2.mp4'
import Button from '@mui/material/Button';
import { Link } from 'react-router-dom';


function SecundarySec2() {

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

    const [text, setText] = useState('Registrati per ottenere un buono sconto')

    // rallento il video
    const videoRef = useRef(null);

    useEffect(() => {
        if (videoRef.current) {
        videoRef.current.playbackRate = 0.7;
        }
    }, []);
    
    return (
        <section className='sec-video-hero'>
            <div className="video-box">
                <video ref={videoRef} controls preload="none" autoPlay muted loop >
                    <source src={Video2} type="video/mp4" />
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
                    <div className="sec-video-text">
                        <h1 >LA NOSTRA MISSIONE</h1> 
                        <span>{text}</span>
                    </div>
                    <Button variant="outlined" sx={btn_style}><Link to='/' style={{color: 'white'}}>LEARN MORE</Link></Button>
                </div>
            </div>  
                       
        </section>
    )
}

export default SecundarySec2
