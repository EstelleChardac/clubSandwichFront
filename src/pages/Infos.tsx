import React from 'react';

import InfosContent from '../components/infos/InfosContent';

const Infos = () => {
  return (
    <div className="infos">
      <InfosContent idPage={11} idTypeKitchen={1} idTypeMusic={2} idTypeAll={3} />
    </div>
  );
};

export default Infos;
