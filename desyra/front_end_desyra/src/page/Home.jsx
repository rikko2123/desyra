import {useState, useEffect} from 'react'
import UrlsSlider from '../components/UrlsSlider'
import NavBar from '../components/NavBar'
import Hero from '../components/Hero'
import Carusel from '../components/Carusel'
import VideoSec from '../components/VideoSec'
import SecondarySec from '../components/SecondarySec'
import JurneySec from '../components/JurneySec'
import SecundarySec2 from '../components/SecundarySec2'
import Footer from '../components/Footer'


function Home() {

    const [category, setCategory] = useState([])
    useEffect(() => {
        fetch('http://127.0.0.1:8000/api/category/')
        .then(response => response.json())
        .then(data => setCategory(data))
    }, [])


    return (
        <div style={{display:'flex', flexDirection: 'column'}}>
            <UrlsSlider/>
            <NavBar category={category} setCategory={setCategory}/>
            <Hero/>
            <Carusel/>
            <VideoSec/>
            <SecondarySec category={category} setCategory={setCategory}/>
            <JurneySec/>
            <SecundarySec2/>
            <Footer/>
        </div>
    )
}

export default Home
