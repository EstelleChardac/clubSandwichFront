import React from 'react';

import ShoppingCard from './ShoppingCard';

const ShoppingList = () => {
  return (
    <div className="list">
      <ShoppingCard id={1} />
      <ShoppingCard id={1} />
      <ShoppingCard id={1} />
      <ShoppingCard id={1} />
      <ShoppingCard id={1} />
      <ShoppingCard id={1} />
    </div>
  );
};

export default ShoppingList;
