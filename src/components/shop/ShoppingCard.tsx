import axios from 'axios';
import React, { useEffect, useState } from 'react';

import IItem from '../../interfaces/IItem';
import ShoppingModal from './ShoppingModal';

// FRONT-END INTERFACE REQUIRED //
interface ShoppingCardProps {
  id: number;
}

const ShoppingCard = ({ id }: ShoppingCardProps) => {
  // I CREATE A USESTATE TO STORE THE DATA FROM THE AXIOS CALL //
  const [item, setItem] = useState<IItem>();

  // I CREATE A USESTATE TO OPEN THE MODAL WHEN CLICKING ON AN ITEM //
  const [modalToOpen, setModalToOpen] = useState<number>(-1);

  // CALL API AXIOS
  const getContent = async () => {
    // CALL ITEM AXIOS.GET FROM THE URL INTERFACE //
    const itemsPage = await axios.get<IItem>(
      `${import.meta.env.VITE_API_URL}/api/items/${id}`,
    );

    // I USE MY USESTATE AND ITS DATA WITH THE SET //
    setItem(itemsPage.data);
  };

  // WHEN LOADING THE COMPONENT, I EXECUTE THE GETCONTENT FUNCTION //
  useEffect(() => {
    getContent();
  }, []);

  return (
    <>
      {/* We make && of the received data, if we have it we send, if not we continue */}
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
      {/* If modalToOpen is greater than or equal to 0 and there is an item 
      then open ShoppingModal. We pass item and setModalToOpen in props */}
      {modalToOpen > -1 && item && (
        <ShoppingModal item={item} setModalToOpen={setModalToOpen} />
      )}
    </>
  );
};

export default ShoppingCard;
