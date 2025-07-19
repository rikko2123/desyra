import React, { use, useState, useEffect, useRef } from 'react'
import '../style/hiddenmenu.css'
import { Link } from 'react-router-dom'


function HiddenMenu({category, setHover, hover}) {

    const [isActive, setIsActive] = useState(false)
    const [chooseDefault, setChooseDefault] = useState([])
    const menuRef = useRef(null)

    
    function handleClick(item) {
        setIsActive(true)
        setChooseDefault([item.name, item.id_category])
    }

    console.log(category[0])
    console.log('choose: ', chooseDefault)
    
    return (
        //!CAMBIA LA CONDIZIONE
        <div 
            ref={menuRef} 
            onMouseEnter={() => setHover(true)}
            onMouseLeave={() => setHover(false)}
            className={hover? 'hidden-menu-box active' : 'hidden-menu-box'} 
        >

            <div className="name-box">
                {category.map((item, index) =>{
                    if(item.parent == null){
                        return (
                            <Link to='#'>
                                <span 
                                    key={index}
                                    onClick={() => handleClick(item)}
                                    style={isActive? {color:'black'}: {color:'rgb(176, 176, 176)'}}
            
                                >
                                    {item.name}
                                </span>
                            </Link>
                        )

                    } else {
                        return null
                    }
                })}
            </div>
            
            <div className="parent-box">
                {category.map((item, index) => {
                    if(item.parent == chooseDefault[1]){
                        return(
                             <span key={index}>{item.name}</span>
                        )
                    } else {
                        return null
                    }
                })} 
                {/* {category.map((item, index) =>{
                    // if(item.name == chooseDefault){
                    //     const child = ''
                    //     for(let i in item){

                    //     }
                    //     return(
                    //         <span key={index}>{item.name}</span>
                    //     )
                    // } else {
                    //     return null
                    // }
                })} */}
            </div>

            <div className="hidden-menu-img">

                {category.map((item, index) => {
                    
                    if(item.name == chooseDefault[0]){
                        const imgPath = item?.category_img?.[0]?.img_path
                        //console.log(imgPath)
                        console.log(isActive)
                        return(
                            <img loading='lazy' key={index} src={decodeURIComponent(imgPath).replace(/^\//, '').replace(/^https:\//, 'https://')} alt="" />
                        )  
                    } else {
                        return null
                    }
                    // else {
                    //     return(
                    //         <img key={index} src={decodeURIComponent(category[0]?.category_img?.[0]?.img_path).replace(/^\//, '').replace(/^https:\//, 'https://')} alt="" />                            
                    //     )
                    // }
                })}
            </div>
        </div>
    )
}

export default HiddenMenu