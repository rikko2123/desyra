import React from 'react'
import UrlsSlider from '../components/UrlsSlider'
import NavBar from '../components/NavBar'
import Hero from '../components/Hero'
import Carusel from '../components/Carusel'
import VideoSec from '../components/VideoSec'
import SecondarySec from '../components/SecondarySec'
import JurneySec from '../components/JurneySec'
import SecundarySec2 from '../components/SecundarySec2'

function Home() {
    return (
        <div style={{display:'flex', flexDirection: 'column'}}>
            <UrlsSlider/>
            <NavBar/>
            <Hero/>
            <Carusel/>
            <VideoSec/>
            <SecondarySec/>
            <JurneySec/>
            <SecundarySec2/>
        </div>
    )
}

export default Home
