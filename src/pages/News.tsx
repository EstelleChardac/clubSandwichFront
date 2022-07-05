import React from 'react';

import ScrollDown from '../components/global/ScrollDown';
import GoToTop from '../components/GoToTop';
import NewsContent from '../components/news/NewsContent';

const News = () => {
  return (
    <div className="news">
      <ScrollDown />
      <NewsContent id={1} />
      <NewsContent id={2} />
      <NewsContent id={1} />
      <NewsContent id={2} />
      <GoToTop />
    </div>
  );
};

export default News;
