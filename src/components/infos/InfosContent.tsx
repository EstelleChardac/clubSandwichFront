import axios from 'axios';
import React, { useEffect, useState } from 'react';

import INewsType from '../../interfaces/INewsType';
import IPage from '../../interfaces/IPage';

//CALL INTERFACE FRONT NEEDED
interface InfosContentProps {
  idPage: number;
  idTypeKitchen: number;
  idTypeMusic: number;
  idTypeAll: number;
}

const InfosContent = ({
  idPage,
  idTypeKitchen,
  idTypeMusic,
  idTypeAll,
}: InfosContentProps) => {
  // JE CRÉE UN USESTATE AFIN DE STOCKER LA DATA ISSU DE L'APPEL AXIOS
  const [page, setPage] = useState<IPage>();
  const [typeKitchen, seTypeKitchen] = useState<INewsType>();
  const [typeMusic, setTypeMusic] = useState<INewsType>();
  const [typeAll, setTypeAll] = useState<INewsType>();

  // APPEL API AXIOS
  const getContent = async () => {
    //APPEL PROMESSE DE NEWSPAGE AXIOS.GET DE L'INTERFACE DE L'URL
    const page = await axios.get<IPage>(`http://localhost:3000/api/pages/${idPage}`);

    const typeKitchen = await axios.get<INewsType>(
      `http://localhost:3000/api/newsTypes/${idTypeKitchen}`,
    );

    const typeMusic = await axios.get<INewsType>(
      `http://localhost:3000/api/newsTypes/${idTypeMusic}`,
    );

    const typeAll = await axios.get<INewsType>(
      `http://localhost:3000/api/newsTypes/${idTypeAll}`,
    );

    setPage(page.data);
    seTypeKitchen(typeKitchen.data);
    setTypeMusic(typeMusic.data);
    setTypeAll(typeAll.data);
  };

  // AU CHARGEMENT DU COMPOSANT, J'EXÉCUTE LA FONCTION GETCONTENT
  useEffect(() => {
    getContent();
  }, []);

  const [isActive, setIsActive] = useState(true);

  return (
    <div className="infosContent">
      <img
        className="infosContent__img"
        src="/assets/Perso-08_1.svg"
        alt="logo_club_sandwich"
      />
      {page && typeKitchen && typeMusic && typeAll && (
        <>
          <div className="infosContent__container">
            <h2 className="infosContent__container__h2">
              Pour les infos concernants les réservations,
            </h2>
            <h1 className="infosContent__container__h1">
              Ça se passe <span className="infosContent__container__h1__span">ici</span>.
            </h1>
            <div className="infosContent__container__boxContainer">
              <h2 className="infosContent__container__boxContainer__h1Mobile">
                Dealer de pdf
              </h2>
              <h3 className="infosContent__container__boxContainer__h3">{page.title}</h3>

              {isActive ? (
                <div
                  className="infosContent__container__boxContainer__select"
                  onClick={() => setIsActive(!isActive)}
                  onKeyDown={() => setIsActive(!isActive)}
                  role="presentation"
                  area-hidden="true">
                  <h3 className="infosContent__container__boxContainer__select__type">
                    {page.description}
                  </h3>
                  <h3 className="infosContent__container__boxContainer__select__arrow">
                    ⟨
                  </h3>
                </div>
              ) : (
                <div
                  className="infosContent__container__boxContainer__select--active"
                  onClick={() => setIsActive(!isActive)}
                  onKeyDown={() => setIsActive(!isActive)}
                  role="presentation"
                  area-hidden="true">
                  <h3 className="infosContent__container__boxContainer__select__type">
                    {page.description}
                  </h3>
                  <h3 className="infosContent__container__boxContainer__select__arrow">
                    ⟨
                  </h3>
                </div>
              )}

              {isActive ? (
                ''
              ) : (
                <>
                  <h2 className="infosContent__container__boxContainer__music">
                    <a
                      className="infosContent__container__boxContainer__music__a"
                      href={typeMusic.pdfFile}
                      download>
                      {typeMusic.name}
                    </a>
                  </h2>{' '}
                  <h2 className="infosContent__container__boxContainer__kitchen">
                    <a
                      className="infosContent__container__boxContainer__kitchen__a"
                      href={typeKitchen.pdfFile}
                      download>
                      {typeKitchen.name}
                    </a>
                  </h2>
                </>
              )}

              <a
                className="infosContent__container__boxContainer__a"
                href={typeAll.pdfFile}>
                {page.subTitle}
              </a>
              <img
                className="infosContent__container__boxContainer__logo"
                src="/assets/Perso-08_1.svg"
                alt="logo_club_sandwich"
              />
            </div>
          </div>
        </>
      )}
    </div>
  );
};

export default InfosContent;
