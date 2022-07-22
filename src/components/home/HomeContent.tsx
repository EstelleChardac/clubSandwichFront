import axios from 'axios';
import React, { useEffect, useState } from 'react';

import IPage from '../../interfaces/IPage';
import IconSvg from '../global/IconSvg';
import Navbar from '../global/Navbar';

// FRONT-END INTERFACE REQUIRED //
interface HomeContentProps {
  id: number;
}

const HomeContent = ({ id }: HomeContentProps) => {
  // I CREATE A USESTATE TO STORE THE DATA FROM THE AXIOS CALL //
  const [content, setContent] = useState<IPage>();

  // CALL API AXIOS //
  const getContent = async () => {
    const url: string = `${import.meta.env.VITE_API_URL}/api/pages/${id}`;
    const { data } = await axios.get<IPage>(url);
    setContent(data);
  };

  // WHEN LOADING THE COMPONENT, I EXECUTE THE GETCONTENT FUNCTION //
  useEffect(() => {
    getContent();
  }, []);

  return (
    <>
      <div className="homeContent">
        <IconSvg myStyle="homeContent__iconCS" icon="logos-club-sandwich-logo" />
        <div className="homeContent__subTitle">{content?.subTitle?.toUpperCase()}</div>
        <div className="homeContent__title">
          CLUB <br /> SANDWICH.
        </div>
        <div className="homeContent__title__mobile">THE CLUB.</div>
      </div>

      <Navbar className="homeContent__navbar" />
      <div className="homeContent__description">
        <div className="homeContent__description__club">{content?.description}</div>
      </div>
    </>
  );
};

export default HomeContent;
