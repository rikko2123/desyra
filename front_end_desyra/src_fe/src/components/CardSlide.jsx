import React, { useState } from 'react'
import '../style/cardslider.css'

function CardSlide({img, title, price}) {
    //creo hover immagini
    const [hover, setHover] = useState(false)

    return (
        <div className='card-box'>
            <div className="card-img" onMouseEnter={() => setHover(true)} onMouseLeave={() => setHover(false)} >
                {/* {img.slice(0, 1).map((item, index) => (
                    //console.log('immagini', item.img_path)
                    <img key={index} src={decodeURIComponent(item.img_path).replace(/^\//, '')} alt="img" /> //pulisco l'url 
                ))} */}
                <img src={decodeURIComponent(img[0]?.img_path).replace(/^\//, '')} alt=""  className="img-default"/>
                <img src={decodeURIComponent(img[1]?.img_path).replace(/^\//, '') } alt="img" className="img-hover"/> 
            </div>

            <div className="card-text">
                <h4>{title}</h4>
                <span>${price}</span>
            </div>

        </div>
    )
}

export default CardSlide
