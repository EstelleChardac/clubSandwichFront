import axios from 'axios';
import React, { useEffect, useState } from 'react';

import IAddress from '../../interfaces/IAddress';
import IOpeningDay from '../../interfaces/IOpeningDay';
import IOpeningHour from '../../interfaces/IOpeningHour';
import IconSvg from './IconSvg';
interface FooterProps {
  className: string;
}

const Footer = ({ className }: FooterProps) => {
  // JE CRÉE UN USESTATE AFIN DE STOCKER LA DATA ISSU DE L'APPEL AXIOS
  const [openingDays, setOpeningDays] = useState<IOpeningDay[]>();
  const [openingHours, setOpeningHours] = useState<IOpeningHour[]>();
  const [address, setAddress] = useState<IAddress>();

  // APPEL API AXIOS
  const getContent = async () => {
    //APPEL PROMESSE // AXIOS.GET DE L'INTERFACE DE L'URL
    const openingDays = await axios.get<IOpeningDay[]>(
      `${import.meta.env.VITE_API_URL}/api/openingDays`,
    );
    const openingHours = await axios.get<IOpeningHour[]>(
      `${import.meta.env.VITE_API_URL}/api/openingHours`,
    );
    const addresses = await axios.get<IAddress[]>(
      `${import.meta.env.VITE_API_URL}/api/addresses`,
    );

    // JE FAIS APPEL A MON USESTATE ET A SA DATA GRACE AU SET
    setOpeningDays(openingDays.data);
    setOpeningHours(openingHours.data);
    setAddress(addresses.data[0]);
  };
  // AU CHARGEMENT DU COMPOSANT, J'EXÉCUTE LA FONCTION GETCONTENT
  useEffect(() => {
    getContent();
  }, []);

  return (
    <div className={className}>
      <div className="footer__info">
        <div className="footer__info__sup">
          <div className={`${className}__info__sup__address`}>
            <span className={`${className}__info__sup__address__street`}>
              {address?.address.toUpperCase()}
            </span>
            <div className={`${className}__info__sup__address__bis`}>
              <span className="footer__info__sup__address__bis__zipcode">
                {address?.zipCode}
              </span>
              <span className="footer__info__sup__address__bis__city">
                {address?.city}
              </span>
            </div>
          </div>
          <div className="footer__info__sup__opening">
            <div className={`${className}__info__sup__opening__openingdays`}>
              {openingDays &&
                openingDays.map((openingDay) => (
                  <p key={openingDay.id}>{openingDay.name}</p>
                ))}
            </div>
            <div className={`${className}__info__sup__opening__openinghours`}>
              {openingHours &&
                openingHours.map((openingHour) => (
                  <p key={openingHour.id}>
                    {openingHour.startMorning}
                    {openingHour.endMorning} / {openingHour.startAfternoon}
                    {openingHour.endAfternoon}
                  </p>
                ))}
            </div>
          </div>
        </div>
        <a
          className={`${className}__instalogo`}
          href="https://instagram.com/club_sandwich64?igshid=YmMyMTA2M2Y="
          target="_blank"
          rel="noreferrer">
          <IconSvg
            myStyle="footer__instalogo footer__instalogo--instagram"
            icon="logos-instagram"
          />
        </a>
      </div>
    </div>
  );
};

export default Footer;
