import React from 'react'
import UrlsSlider from '../components/UrlsSlider'
import NavBar from '../components/NavBar'
import Hero from '../components/Hero'

function Home() {
    return (
    <div style={{display:'flex', flexDirection: 'column'}}>
        <UrlsSlider/>
        <NavBar/>
        <Hero/>
    </div>
    )
}

export default Home
