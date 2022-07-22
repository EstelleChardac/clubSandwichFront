import axios from 'axios';
import React, { useEffect, useState } from 'react';

import Footer from '../components/global/Footer';
import GoToTop from '../components/global/GoToTop';
import ScrollDown from '../components/global/ScrollDown';
import NewsContent from '../components/news/NewsContent';
import IPage from '../interfaces/IPage';

const News = () => {
  const [pages, setPage] = useState<IPage[]>();

  // CALL API AXIOS //
  const getContent = async () => {
    // CALL ITEM AXIOS.GET FROM THE URL INTERFACE //
    const pages = await axios.get<IPage[]>(
      `${import.meta.env.VITE_API_URL}/api/newspages`,
    );

    // I USE MY USESTATE AND ITS DATA WITH THE SET //
    setPage(pages.data);
  };

  // WHEN LOADING THE COMPONENT, I EXECUTE THE GETCONTENT FUNCTION //
  useEffect(() => {
    getContent();
  }, []);

  return (
    <div className="news">
      <ScrollDown />
      <h2 className="news__h2Mobile">ça part</h2>
      <span className="news__h2Mobile">de là</span>
      {pages && pages.map((page) => <NewsContent id={page.id} key={page.id} />)}
      <Footer className="footer" />
      <GoToTop />
    </div>
  );
};

export default News;
