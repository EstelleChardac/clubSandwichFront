// Import Swiper styles
import 'swiper/css';
import 'swiper/css/pagination';

import axios from 'axios';
import React, { useEffect, useState } from 'react';
// import './styles.css';
// import required modules
import { Autoplay, Pagination, Parallax } from 'swiper';
// Import Swiper React components
import { Swiper, SwiperSlide } from 'swiper/react';

import ISupplier from '../../interfaces/ISupplier';

const DealersMobileSection = () => {
  const [supplierList, setSupplierList] = useState<ISupplier[]>();

  // APPEL API AXIOS POUR TOUS LES SUPPLIERS
  const getSupplierList = async () => {
    const supplierContentList = await axios.get<ISupplier[]>(
      `http://localhost:3000/api/suppliers/`,
    );
    setSupplierList(supplierContentList.data);
  };

  // AU CHARGEMENT DU COMPOSANT, J'EXÉCUTE LA FONCTION GETPAGE
  useEffect(() => {
    getSupplierList();
  }, []);

  return (
    <div className="dealersSection">
      {supplierList && (
        <>
          <div className="dealersSection__text">
            <h2 className="dealersSection__text__sectionTitle">dealers</h2>
            <h2 className="dealersSection__text__outLine">LOCALS</h2>
          </div>
          <div className="dealersSection__supplier">
            <Swiper
              slidesPerView={1.07}
              spaceBetween={10}
              loop
              pagination={{
                clickable: true,
              }}
              modules={[Pagination, Autoplay, Parallax]}
              className="mySwiper">
              {/* NEED TO MAP THIS BELOW */}
              {/* {supplierList.map((supplier, index) => {
                <SwiperSlide>
                  <img
                    key={index}
                    className="dealersSection__supplier__imageCaroussel"
                    src={supplier.logo}
                    alt={supplier.name}
                  />
                </SwiperSlide>;
              })} */}
              <SwiperSlide>
                <div className="dealersSection__supplier__infos">
                  <div>{supplierList[0].name}</div>
                  <div>{supplierList[0].location}</div>
                </div>
                <img
                  className="dealersSection__supplier__imageCaroussel"
                  src={supplierList[0].logo}
                  alt={supplierList[0].logo}
                />
              </SwiperSlide>
              <SwiperSlide>
                <div className="dealersSection__supplier__infos">
                  <div>{supplierList[1].name}</div>
                  <div>{supplierList[1].location}</div>
                </div>
                <img
                  className="dealersSection__supplier__imageCaroussel"
                  src={supplierList[1].logo}
                  alt={supplierList[1].logo}
                />
              </SwiperSlide>
              <SwiperSlide>
                <div className="dealersSection__supplier__infos">
                  <div>{supplierList[2].name}</div>
                  <div>{supplierList[2].location}</div>
                </div>
                <img
                  className="dealersSection__supplier__imageCaroussel"
                  src={supplierList[2].logo}
                  alt={supplierList[2].logo}
                />
              </SwiperSlide>
              <SwiperSlide>
                <div className="dealersSection__supplier__infos">
                  <div>{supplierList[3].name}</div>
                  <div>{supplierList[3].location}</div>
                </div>
                <img
                  className="dealersSection__supplier__imageCaroussel"
                  src={supplierList[3].logo}
                  alt={supplierList[3].logo}
                />
              </SwiperSlide>
              <SwiperSlide>
                <div className="dealersSection__supplier__infos">
                  <div>{supplierList[4].name}</div>
                  <div>{supplierList[4].location}</div>
                </div>
                <img
                  className="dealersSection__supplier__imageCaroussel"
                  src={supplierList[4].logo}
                  alt={supplierList[4].logo}
                />
              </SwiperSlide>
            </Swiper>
          </div>
        </>
      )}
    </div>
  );
};

export default DealersMobileSection;
