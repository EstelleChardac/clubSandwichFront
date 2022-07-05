import React from 'react';

import Logo from './Logo';

const Footer = () => {
  return (
    <div className="footer">
      <div className="footer__info">
        <div className="footer__info__sup">
          <div className="footer__info__sup__address">
            <span className="footer__info__sup__address__street">
              24, RUE D&apos;ESPAGNE
            </span>
            <span>64200 BIARRITZ</span>
          </div>
          <div className="footer__info__sup__opening">
            <div className="footer__info__sup__opening__openingdays">
              <p>MAR-JEU</p>
              <p>VEN-SAM</p>
              <p>DIM</p>
            </div>
            <div className="footer__info__sup__opening__openinghours">
              <p>11:00-15:00 / 18:00-23:00 </p>
              <p>11:00-15:00 / 18:00-00:00</p>
              <p>11:00-14:00</p>
            </div>
          </div>
        </div>
        <a
          className="footer__instalogo"
          href="https://instagram.com/club_sandwich64?igshid=YmMyMTA2M2Y="
          target="_blank"
          rel="noreferrer">
          <Logo myStyle="icon icon--instagram" icon="logos-instagram" />
        </a>
      </div>
    </div>
  );
};

export default Footer;
