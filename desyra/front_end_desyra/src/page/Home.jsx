import React from 'react'
import UrlsSlider from '../components/UrlsSlider'
import NavBar from '../components/NavBar'
import Hero from '../components/Hero'
import Carusel from '../components/Carusel'
import VideoSec from '../components/VideoSec'
function Home() {
    return (
        <div style={{display:'flex', flexDirection: 'column'}}>
            <UrlsSlider/>
            <NavBar/>
            <Hero/>
            <Carusel/>
            <VideoSec/>
        </div>
    )
}

export default Home
