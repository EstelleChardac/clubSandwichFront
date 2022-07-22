import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { NavLink } from 'react-router-dom';

import IPageType from '../../interfaces/IPageType';
import Footer from './Footer';
import IconSvg from './IconSvg';

// FRONT-END INTERFACE REQUIRED //
interface NavbarProps {
  className: string;
}
const Navbar = ({ className }: NavbarProps) => {
  const title = window.location.pathname;
  // I CREATE A USESTATE TO OPEN OR EXIT THE MENU BURGER //
  const [isOpened, setIsOpened] = useState(false);
  // I CREATE A USESTATE TO STORE THE DATA FROM THE AXIOS CALL //
  const [pageType, setPageType] = useState<IPageType[]>();
  // CALL API AXIOS //
  const getContent = async () => {
    // CALL PAGETYPES AXIOS.GET FROM THE URL INTERFACE //
    const pageTypes = await axios.get<IPageType[]>(
      `${import.meta.env.VITE_API_URL}/api/pageTypes`,
    );

    // I USE MY USESTATE AND ITS DATA WITH THE SET //
    setPageType(pageTypes.data);
  };

  // WHEN LOADING THE COMPONENT, I EXECUTE THE GETCONTENT FUNCTION //
  useEffect(() => {
    getContent();
  }, []);

  return (
    <header className={className}>
      {/* :DESKTOP MENU */}

      {title !== '/home' && <div className={`${className}__title`}>{title.slice(1)}</div>}

      <nav className={`${className}__desktop`}>
        {pageType &&
          pageType.map((pageType) => (
            <NavLink
              className={(navData) =>
                navData.isActive
                  ? `${className}__desktop__link ${className}__desktop__link--active`
                  : `${className}__desktop__link`
              }
              key={pageType.path}
              to={pageType.path}>
              {pageType.name}
            </NavLink>
          ))}
      </nav>
      {/* >> Menu Burger Icon */}
      {!isOpened ? (
        <div
          className={`${className}__button--burger`}
          role="button"
          tabIndex={0}
          onKeyPress={() => setIsOpened(!isOpened)}
          onClick={() => {
            setIsOpened(!isOpened);
          }}>
          <IconSvg myStyle={`${className}__mobile__up__icon`} icon="logos-menu-burger" />
        </div>
      ) : (
        <div
          className={`${className}__button ${className}__button--cross`}
          role="button"
          tabIndex={0}
          onKeyPress={() => setIsOpened(!isOpened)}
          onClick={() => {
            setIsOpened(!isOpened);
          }}>
          <IconSvg myStyle={`${className}__mobile__up__icon`} icon="logos-cross" />
        </div>
      )}
      {/* :MOBILE MENU */}
      {isOpened && (
        <div className={`${className}__mobile`}>
          {/* >> Part Up // Logo // Menu */}
          <div className={`${className}__mobile__up`}>
            <IconSvg
              myStyle={`${className}__mobile__up__icon ${className}__mobile__up__icon--cs`}
              icon="logos-club-sandwich-logo"
            />
            <nav className={`${className}__mobile__up__nav`}>
              {pageType &&
                pageType.map((pageType) => (
                  <NavLink
                    className={`${className}__mobile__up__nav--link`}
                    key={pageType.path}
                    to={pageType.path}
                    onClick={() => {
                      setIsOpened(!isOpened);
                    }}>
                    {pageType.name}
                  </NavLink>
                ))}
            </nav>
            <div className={`${className}__mobile__up--text`}>on vous</div>
          </div>
          {/* >> Part Down // Address */}
          <div className={`${className}__mobile__down`}>
            <p className={`${className}__mobile__down--text`}>
              <span className={`${className}__mobile__down--text--animated`}>
                aime <br />
                embrasse <br />
                adore <br />
                attend <br />
                veut <br />
              </span>
            </p>
            {/* >> Footer */}
            <Footer className={`${className}__mobile__down__footer__burger`} />
          </div>
        </div>
      )}
    </header>
  );
};

export default Navbar;
