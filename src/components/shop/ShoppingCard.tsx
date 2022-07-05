import axios from 'axios';
import React, { useEffect, useState } from 'react';

import IItem from '../../interfaces/IItem';
import ShoppingModal from './ShoppingModal';

//INTERFACE D'APPEL FRONT NÉCESSAIRE
interface ShoppingCardProps {
  id: number;
}

const ShoppingCard = ({ id }: ShoppingCardProps) => {
  // JE CRÉE UN USESTATE AFIN DE STOCKER LA DATA ISSU DE L'APPEL AXIOS
  const [item, setItem] = useState<IItem>();

  // JE CRÉE UN USESTATE AFIN D'OUVRIR LA MODALE AU CLIC SUR UN ITEM
  const [modalToOpen, setModalToOpen] = useState<number>(-1);

  // APPEL API AXIOS
  const getContent = async () => {
    //APPEL PROMESSE DE NEWSPAGE AXIOS.GET DE L'INTERFACE DE L'URL
    const itemsPage = await axios.get<IItem>(`http://localhost:3000/api/items/${id}`);

    // JE FAIS APPEL A MON USESTATE ET A SA DATA GRACE AU SET
    setItem(itemsPage.data);
  };

  // AU CHARGEMENT DU COMPOSANT, J'EXÉCUTE LA FONCTION GETCONTENT
  useEffect(() => {
    getContent();
  }, []);

  return (
    <>
      {/* On fais un && des data reçus, si on l'a on envoi, sinon on continu */}
      {item && (
        <div
          className="card"
          role="button"
          tabIndex={0}
          onKeyPress={() => setModalToOpen(item?.id)}
          onClick={() => {
            setModalToOpen(item?.id);
          }}>
          <img className="card__img" src={item.image1} alt={item.title} />
          <div className="card__fadebox">
            <div className="card__fadebox__button">
              JE VEUX
              <span className="card__fadebox__button--line2">en savoir plus</span>
            </div>
          </div>
        </div>
      )}
      {/* Si modalToOpen est supérieur ou égal à 0 et qu'il y a un item */}
      {/* Alors ouvre ShoppingModal // On passe item et setModalToOpen en props*/}
      {modalToOpen > -1 && item && (
        <ShoppingModal item={item} setModalToOpen={setModalToOpen} />
      )}
    </>
  );
};

export default ShoppingCard;
