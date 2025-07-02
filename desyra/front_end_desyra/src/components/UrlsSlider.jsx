import React from 'react'
import { Swiper, SwiperSlide } from 'swiper/react';
import { Autoplay, EffectFade } from 'swiper/modules';
// Import Swiper styles
import 'swiper/css';

// componente chebmi slida in automatico delle frasi sopra la navbar
function urlsSlider() {

    const slides = [
        'Enjoy complimentary shipping on all orders.',
        'New arrivals now available online.',
        'Discover our latest collaboration.',
    ];

    return (
        <div className='urlSlider' style={{width:'100%', height:'2.2rem'}}>
            <Swiper
                modules={[Autoplay]}
                autoplay={{ delay: 3000}}
                spaceBetween={50}
                loop={true}
                slidesPerView={1}
                style={{textAlign:'center', backgroundColor: 'black', color:'whitesmoke', height:'100%', alignItems:'center', justifyContent:'center', display:'flex'}}   
            >
                {/* itero sull-array slides tramite map*/}
                {slides.map((item_to_slide, index)=>(
                    <SwiperSlide 
                        key={index}
                        style={{
                            display: 'flex',
                            justifyContent: 'center',
                            alignItems: 'center',
                            height: '100%',
                         }}
                    >
                        {item_to_slide}
                    </SwiperSlide>
                ))}
            </Swiper>
        </div>
    )
}

export default urlsSlider
