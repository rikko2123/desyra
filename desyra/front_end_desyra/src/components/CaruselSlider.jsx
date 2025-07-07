import React from 'react'
import { Swiper, SwiperSlide } from 'swiper/react';
import CardSlide from './CardSlide';
import { Link } from 'react-router-dom';
// Import Swiper styles
import 'swiper/css';


function CaruselSlider({data, brand}) {
    
    return (
        <Swiper
            slidesPerView={4}
            loop={true}
            style={{height:'100%', display: 'flex', justifyContent:'space-evenly', paddingLeft:'20px', paddingRight:'20px', overflow:'hidden'}}
            spaceBetween={20}
        >
            {data.map((item, index) => {
                // console.log(item, index)
                if(item.name === brand){

                    return item.products.map((product, i) => (
                        //console.log(product)
                        <SwiperSlide key={`${index}-${i}`} style={{height:'100%'}}>
                            <Link to='#'><CardSlide img={product.images} title={product.name} price={product.price}/></Link>
                        </SwiperSlide>
                    ))

                } else {
                    return null
                }
                
            })}

        </Swiper>
    )
}

export default CaruselSlider
