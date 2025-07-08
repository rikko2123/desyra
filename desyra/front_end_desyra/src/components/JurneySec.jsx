import React from 'react'
import { Swiper, SwiperSlide } from 'swiper/react'
import { Link } from 'react-router-dom';
import Img1  from '../assets/im1.jpg'
import Img2 from '../assets/img2.jpg'
import Img3  from '../assets/img3.jpg'
import Img4  from '../assets/img4.jpg'
import Img5  from '../assets/img5.jpg'
import Img6  from '../assets/img6.jpg'
// Import Swiper styles
import 'swiper/css';

const jurnal = [
    {img: Img1, title: "Dall'Idea alla Vetrina: com'è nato il nostro shop", desc : "Tutto è cominciato da un'intuizione semplice, ma potente: creare uno spazio che unisse estetica, qualità e personalità. In questo articolo raccontiamo i primi passi, gli errori, i dubbi e l'entusiasmo che ci hanno portati a trasformare un'idea in una realtà concreta. Un racconto sincero su come è nato il nostro shop."},
    {img: Img2, title: 'Il primo ordine non si scorda mai', desc : "Il primo ordine non si scorda mai"},
    {img: Img3, title: 'Dietro le quinte: chi siamo davvero', desc : "Dietro ogni immagine, descrizione e pacco spedito ci siamo noi: persone vere, con storie, passioni e visioni. In questo articolo apriamo le porte del nostro mondo, presentandoci senza filtri. Scopri chi c'è dietro lo shop, cosa ci muove ogni giorno e perché crediamo così tanto in quello che facciamo."},
    {img: Img4, title: 'Ogni pezzo racconta una storia', desc : "Non selezioniamo i nostri prodotti a caso. Ogni articolo che trovi sullo shop è frutto di una ricerca accurata, di un legame con chi lo crea, di un messaggio che vogliamo trasmettere. In questo racconto ti spieghiamo cosa c’è dietro ogni scelta e perché ogni singolo pezzo che offriamo ha un’anima propria"},
    {img: Img5, title: 'Dalle difficoltà alle soluzioni', desc : 'Avere un’idea è facile, metterla in pratica no. Abbiamo affrontato imprevisti, errori di valutazione, problemi tecnici e momenti di incertezza. Ma ogni ostacolo ci ha insegnato qualcosa e ci ha resi più forti. In questo articolo condividiamo senza filtri le sfide più dure e come le abbiamo superate, per ispirare chi vuole costruire qualcosa di suo.'},
    {img: Img6, title: 'la nostra visione per il futuro', desc : "Non ci fermiamo qui. Lo shop è solo l’inizio di un progetto più grande: vogliamo creare una community, proporre prodotti sempre più sostenibili e fare la differenza con scelte consapevoli. Qui ti raccontiamo quali sono i nostri obiettivi, i sogni che stiamo coltivando e il percorso che vogliamo intraprendere nei prossimi anni."},
]

function JurneySec() {

    return (
        <section style={{height: '85vh',backgroundColor:'rgba(255, 255, 255, 0.46)'}}>
            <div className="jurney-title" style={{height:'18%', display:'flex', width:'20%', justifyContent:'flex-start', alignItems:'center'}}>
                <p style={{fontSize:'3rem', color:'rgb(69, 69, 69)', paddingLeft:'20px', paddingRight:'20px'}}>OUR STORY</p>
            </div>

            <Swiper
                slidesPerView={4}
                loop={true}
                style={{
                    height:'78%', 
                    display: 'flex', 
                    justifyContent:'space-evenly', 
                    paddingLeft:'20px', 
                    paddingRight:'20px', 
                    overflow:'hidden'
                }}
                spaceBetween={20} 
            >
                {jurnal.map((item, index) => (
                    <SwiperSlide key={index}>
                        <Link to='#'>
                            <div 
                                className='card-box'  
                                style={{overflow:'hidden', transition: 'transform 0.3s ease',}}   
                                onMouseEnter={(e) => e.currentTarget.style.transform = 'scale(1.05)'}
                                onMouseLeave={(e) => e.currentTarget.style.transform = 'scale(1)'}
                            >
                                <div className="card-img">
                                    {/* {img.slice(0, 1).map((item, index) => (
                                        //console.log('immagini', item.img_path)
                                        <img key={index} src={decodeURIComponent(item.img_path).replace(/^\//, '')} alt="img" /> //pulisco l'url 
                                    ))} */}
                                    <img src={item.img} loading='lazy' alt=""/>
                            
                                </div>

                                <div className="card-text">
                                    <h4>{item.title}</h4>
                                    <span>{item.desc}</span>
                                </div>
                            </div>
                        </Link>
                    </SwiperSlide>
                ))}

            </Swiper>
        </section>
    )
}

export default JurneySec
