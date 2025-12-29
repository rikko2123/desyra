import React, { useEffect, useState } from 'react'
import { data } from 'react-router-dom'
import '../style/secondarysec.css'
// import gsap from 'gsap';
// import {ScrollTrigger} from 'gsap/ScrollTrigger';

//

function SecondarySec({category, setCategory}) {

    // const [category, setCategory] = useState([])

    // // // animazione scroll
    // // useEffect(() => {
    // //     gsap.registerPlugin(ScrollTrigger);

    // //     ScrollTrigger.create({
    // //         trigger: '.pin-me',
    // //         start: 'top top',
    // //         end: '+=1000', // distanza dello scroll
    // //         pin: true,
    // //         scrub: false, // se vuoi che segua lo scroll metti true
    // //         markers: true // opzionale per debug
    // //     });
    // // }, []);

    // useEffect(() => {
    //     fetch('http://127.0.0.1:8000/api/category/')
    //     .then(response => response.json())
    //     .then(data => setCategory(data))
    // }, [])

    const imgDefault = category[0]?.category_img?.[0]?.img_path
    const [selcat, setSelCat] = useState('')
    const [hover, setHover] = useState(false)
    
    console.log(hover)
    return (
        <section style={{height:'95vh', width:'100%', display:'flex', justifyContent:'center', alignItems:'center', paddingTop:'30px', paddingBottom:'30px'}} className='sticky-box'>
            <div style={{display:'flex', flexDirection: 'column', flex: '1', justifyContent:'center', alignItems:'center', gap:'10px'}} className='pin-me'>
                <span style={{fontSize:'1.3rem'}}>SHOP BY CATEGORY</span>

                <div 
                    className="category-box-sec"
                    // onMouseLeave={() => {
                    //     setSelCat(imgDefault)
                    //     setHover(false)
                    // }}
                    style={{display:'flex', flexDirection:'column', justifyContent:'center', alignItems:'center'}}
                >

                    {category.filter(cat => cat.parent === null).slice(0, 10).map((item, index) => (
                        <span 
                            key={index}
                            onMouseEnter={() => {
                                setSelCat(decodeURIComponent(item?.category_img?.[0]?.img_path).replace(/^\//, ''))
                                setHover(true)
                            }}
                            onMouseLeave={() => {
                                setSelCat(imgDefault)
                                setHover(false)
                            }}
                            style={{
                                fontSize:'2.8rem'
                            }}  
                            className='sec-link'               
                        >   
                            {item.name}
                        </span>
                    ))}
                </div>
            </div>

            <div style={{display:'flex', flex:'1', height:'100%', width:'100%'}} className='sec-img-box'>
                {hover ? <img 
                                src={selcat} 
                                alt="" 
                                style={{height:'100%', width:'100%', objectFit:'cover', opacity: '1', transition: 'opacity 0.5s ease-in-out'}} 
                                className='sec-img-hover'/> 
                    : 
                    <img 
                        src={decodeURIComponent(imgDefault).replace(/^\//, '').replace(/^https:\//, 'https://')} 
                        alt="" 
                        style={{height:'100%', width:'100%', objectFit:'cover', opacity: '1', transition: 'opacity 0.5s ease-in-out'}} 
                        className='sec-img-default'/>
                }

            </div>
        </section>
    )
}

export default SecondarySec
