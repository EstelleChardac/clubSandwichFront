import axios from 'axios';
import React, { useEffect, useState } from 'react';

import INewsPage from '../../interfaces/INewsPage';
import INewsType from '../../interfaces/INewsType';
import Button from '../global/Button';

//CALL INTERFACE FRONT NEEDED
interface NewsContentProps {
  id: number;
}

const NewsContent = ({ id }: NewsContentProps) => {
  // JE CRÉE UN USESTATE AFIN DE STOCKER LA DATA ISSU DE L'APPEL AXIOS
  const [page, setPage] = useState<INewsPage>();
  const [type, setType] = useState<INewsType>();

  // APPEL API AXIOS
  const getContent = async () => {
    //APPEL PROMESSE DE NEWSPAGE AXIOS.GET DE L'INTERFACE DE L'URL
    const newsPage = await axios.get<INewsPage>(
      `${import.meta.env.VITE_API_URL}/api/newsPages/${id}`,
    );

    //APPEL PROMESSE DE NEWSTYPE AXIOS.GET DE L'INTERFACE DE L'URL
    const newsType = await axios.get<INewsType>(
      `${import.meta.env.VITE_API_URL}/api/newsTypes/${newsPage.data.idNewsType}`,
    );

    setPage(newsPage.data);
    setType(newsType.data);
  };

  // AU CHARGEMENT DU COMPOSANT, J'EXÉCUTE LA FONCTION GETCONTENT
  useEffect(() => {
    getContent();
  }, []);

  //J'INITIALISE LE BOUTTON SUR FALSE AVEC UNE FUNC QUI LE PASSE A TRUE
  const [isClicked, setIsClicked] = useState<boolean>(false);
  const handleClick = () => {
    setIsClicked(!isClicked);
  };

  return (
    <div className="newsContent">
      {/* On fais un && des data reçus, si on l'a on envoi, sinon on continu */}
      {page && type && (
        <>
          {isClicked ? (
            <img className="newsContent__img--active" src={page.image} alt={page.title} />
          ) : (
            <img className="newsContent__img" src={page.image} alt={page.title} />
          )}
          <div className="newsContent__container">
            <div className="newsContent__container__header">
              <div className="newsContent__container__header__titleContainer">
                <h1 className="newsContent__container__header__titleContainer__h1">
                  POP
                </h1>
                <h1 className="newsContent__container__header__titleContainer__h1__span">
                  <span className="newsContent__container__header__titleContainer__h1__span__uLetter">
                    U
                  </span>
                  P
                </h1>
              </div>
              <div className="newsContent__container__header__infosContainer">
                <h2 className="newsContent__container__header__infosContainer__h2">
                  {type.name}
                </h2>
                <h3 className="newsContent__container__header__infosContainer__h3">
                  {page.durationEvent}
                </h3>
                <h4 className="newsContent__container__header__infosContainer__h4">
                  {page.title}
                </h4>
                <p className="newsContent__container__header__infosContainer__p">
                  {page.description}
                </p>
                {isClicked ? (
                  <div className="newsContent__mobileContainer">
                    <p className="newsContent__mobileContainer__pMobile">
                      {page.description}
                    </p>
                    <img
                      className="newsContent__mobileContainer__logo"
                      src="/assets/xClubSandwich.svg"
                      alt="logo_club_sandwich_close"
                      onClick={handleClick}
                      onKeyDown={handleClick}
                      role="presentation"
                      area-hidden="true"
                    />
                  </div>
                ) : (
                  <div
                    onClick={handleClick}
                    onKeyDown={handleClick}
                    role="presentation"
                    area-hidden="true">
                    <Button className="buttonNews" text="En savoir plus" />
                  </div>
                )}
              </div>
            </div>
          </div>
        </>
      )}
    </div>
  );
};

export default NewsContent;
