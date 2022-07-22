import axios from 'axios';
import React, { useEffect, useState } from 'react';

import IPage from '../../interfaces/IPage';
import IPageType from '../../interfaces/IPageType';
import Gallery from './Gallery';

interface WallOfDwichProps {
  idPageType: number;
}

const GalleryList = ({ idPageType }: WallOfDwichProps) => {
  const [images7by7, setImages7by7] = useState<IPage[][]>();

  // todo : add wallofdwich axios here and splits after

  // AU CHARGEMENT DU COMPOSANT, J'EXÉCUTE LA FONCTION GETCONTENT
  useEffect(() => {
    // APPEL API AXIOS
    const getContent = async () => {
      const pageType = await axios.get<IPageType>(
        `${import.meta.env.VITE_API_URL}/api/pageTypes/${idPageType}`,
      );

      //APPEL PROMESSE DE PAGE AXIOS.GET DE L'INTERFACE DE L'URL
      const { data } = await axios.get<IPage[]>(
        `${import.meta.env.VITE_API_URL}/api/pageTypes/${pageType.data.id}/pages`,
      );

      const tempo7 = [];

      // takes all images from wallOfDwich and splits them into array of 7 images
      for (let i = 0; i < data.sort((a, b) => b.id - a.id).length; i += 7) {
        // loops every 7n elements
        const tempoArray = data.sort((a, b) => b.id - a.id).slice(i, i + 7);
        tempo7.push(tempoArray);
      }

      setImages7by7(tempo7);
    };
    getContent();
  }, []);

  return (
    <div className="gallery">
      <h1 className="gallery__h1">
        SAY <span className="gallery__h1__span">HELLO TO </span>
        <span className="gallery__h1__span2">MASTERPIECES</span>
      </h1>
      <h2 className="gallery__h2Mobile">in dwich</h2>
      <h2 className="gallery__h2Mobile">we trust</h2>
      <div className="gallery__allGrid">
        {images7by7 &&
          images7by7.map((images7, index) => <Gallery data={images7} key={index} />)}
      </div>
    </div>
  );
};

export default GalleryList;
