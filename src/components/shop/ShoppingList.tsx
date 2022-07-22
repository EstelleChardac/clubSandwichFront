import axios from 'axios';
import React, { useEffect, useState } from 'react';

import IItem from '../../interfaces/IItem';
import ShoppingCard from './ShoppingCard';

const ShoppingList = () => {
  // I CREATE A USESTATE TO STORE THE DATA FROM THE AXIOS CALL //
  const [items, setItems] = useState<IItem[]>();

  // CALL API AXIOS //
  const getContent = async () => {
    // CALL ITEM AXIOS.GET FROM THE URL INTERFACE //
    const items = await axios.get<IItem[]>(`${import.meta.env.VITE_API_URL}/api/items`);

    // I USE MY USESTATE AND ITS DATA WITH THE SET //
    setItems(items.data);
  };

  // WHEN LOADING THE COMPONENT, I EXECUTE THE GETCONTENT FUNCTION //
  useEffect(() => {
    getContent();
  }, []);

  //I get all the products (route get api/items) and for each product of my list //
  //I will map the shoppingCard component and pass it the product to display //
  return (
    <div className="list">
      {items && items.map((item) => <ShoppingCard id={item.id} key={item.id} />)}
    </div>
  );
};

export default ShoppingList;
