import React, { useEffect, useState } from 'react';

import DealersMobileSection from '../components/dealers/DealersMobileSection';
import DealersSection from '../components/dealers/DealersSection';

const Dealers = () => {
  // CREATING USESTATE TO DETECT WINDOW WIDTH (ABOUT MOBILE CAROUSSEL)
  const [windowSize, setWindowSize] = useState(getWindowSize());

  // GETTING WINDOW SIZE WITH DESTRUCTURATION
  function getWindowSize() {
    const { innerWidth, innerHeight } = window;
    return { innerWidth, innerHeight };
  }

  // DETECTING WHEN COMPONENT MOUNT THE WIDTH OF THE WINDOW
  useEffect(() => {
    function handleWindowResize() {
      setWindowSize(getWindowSize());
    }

    window.addEventListener('resize', handleWindowResize);

    return () => {
      window.removeEventListener('resize', handleWindowResize);
    };
  }, []);

  return windowSize.innerWidth >= 1023 ? (
    <div className="dealers">
      <DealersSection id={6} idSupplier={1} />
      <DealersSection id={7} idSupplier={2} />
      <DealersSection id={8} idSupplier={3} />
      <DealersSection id={9} idSupplier={4} />
      <DealersSection id={10} idSupplier={5} />
    </div>
  ) : (
    <div>
      <DealersMobileSection />
    </div>
  );
};

export default Dealers;
