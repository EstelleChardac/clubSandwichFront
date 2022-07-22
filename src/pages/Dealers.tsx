import axios from 'axios';
import React, { useEffect, useState } from 'react';

import DealersSection from '../components/dealers/DealersSection';
import Footer from '../components/global/Footer';
import GoToTop from '../components/global/GoToTop';
import ScrollDown from '../components/global/ScrollDown';
import IPage from '../interfaces/IPage';

const Dealers = () => {
  const [pages, setPage] = useState<IPage[]>();

  // CALL API AXIOS //
  const getContent = async () => {
    // CALL ITEM AXIOS.GET FROM THE URL INTERFACE //
    const pages = await axios.get<IPage[]>(
      `${import.meta.env.VITE_API_URL}/api/pageTypes/4/pages`,
    );

    // I USE MY USESTATE AND ITS DATA WITH THE SET //
    setPage(pages.data);
  };

  // WHEN LOADING THE COMPONENT, I EXECUTE THE GETCONTENT FUNCTION //
  useEffect(() => {
    getContent();
  }, []);

  return (
    <div className="dealers">
      <ScrollDown />
      <h2 className="dealers__outLine">LOCALS</h2>

      {pages &&
        pages.map((section) => (
          <DealersSection
            id={section.id}
            idSupplier={section.idSupplier}
            key={section.id}
          />
        ))}
      <Footer className="footer" />
      <GoToTop />
    </div>
  );
};

export default Dealers;
