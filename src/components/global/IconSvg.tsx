import React from 'react';

import Icons from '../../../public/assets/logos.svg';

interface Props {
  icon?: string;
  myStyle?: string;
}

const IconSvg = ({ icon, myStyle }: Props) => {
  return (
    <>
      <svg className={myStyle}>
        <use xlinkHref={`${Icons}#${icon}`}></use>
      </svg>
    </>
  );
};

export default IconSvg;
