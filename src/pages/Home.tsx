import React from 'react';

import Footer from '../components/global/Footer';
import HomeContent from '../components/home/HomeContent';

const Home = () => {
  return (
    <>
      <div className="home">
        <HomeContent id={5} />
        <Footer />
      </div>
    </>
  );
};

export default Home;

/* <h1>
        WELCOME TO <span className="home__title--club">THE CLUB</span>
      </h1>
      {/* Exemple pour appeler le logo.svg / 
      myStyle = nom de la classe pour le SCSS

      icon = nom de l'id dans le fichier SVG (dans assets) 
            <Logo myStyle="icon icon--menu" icon="logos-club-sandwich-logo" />*/
