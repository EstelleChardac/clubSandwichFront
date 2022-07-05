import React from 'react';

import Icons from '../../../public/assets/logos.svg';

interface Props {
  icon?: string;
  myStyle?: string;
}

const Logo = ({
  icon = 'logos-club-sandwich-logo',
  myStyle = 'logo__logotype',
}: Props) => {
  return (
    <>
      <div className="logo">
        <svg className={myStyle}>
          <use xlinkHref={`${Icons}#${icon}`}></use>
        </svg>
      </div>
    </>
  );
};

export default Logo;
