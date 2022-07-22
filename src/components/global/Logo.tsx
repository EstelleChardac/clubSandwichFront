import React from 'react';
import { NavLink } from 'react-router-dom';

import Icons from '../../../public/assets/logos.svg';

interface Props {
  icon?: string;
  myStyle?: string;
}

// SEULEMENT LE LOGO CLUB SANDWICH
// VISIBLE SUR DESKTOP
// SINON UTILISER LE COMPOSANT ICONSVG

const Logo = ({
  icon = 'logos-club-sandwich-logo',
  myStyle = 'logo__logotype',
}: Props) => {
  return (
    <>
      <div className="logo">
        <NavLink to="/">
          <svg className={myStyle}>
            <use xlinkHref={`${Icons}#${icon}`}></use>
          </svg>
        </NavLink>
      </div>
    </>
  );
};

export default Logo;
