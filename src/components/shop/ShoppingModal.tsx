// Import Swiper styles
import 'swiper/css';
import 'swiper/css/pagination';

import React from 'react';
// import required modules
import { Pagination } from 'swiper';
import { Swiper, SwiperSlide } from 'swiper/react';

import IItem from '../../interfaces/IItem';
import IconSvg from '../global/IconSvg';

// FRONT-END INTERFACE REQUIRED //
interface ShoppingModalProps {
  item: IItem;
  setModalToOpen: React.Dispatch<React.SetStateAction<number>>;
}

const ShoppingModal = ({ item, setModalToOpen }: ShoppingModalProps) => {
  return (
    <div className="shoppingModal">
      <div className="shoppingModal__containt">
        <span className="shoppingModal__containt--mobile">PREVIEW </span>
        {/* >> Div Top */}
        <div className="shoppingModal__containt__up">
          {/* >> Title */}
          <div className="shoppingModal__containt__up__title">
            <h1 className="shoppingModal__containt__up__title--h1">{item?.title}</h1>
            <h2 className="shoppingModal__containt__up__title--h2">{item?.subTitle}</h2>
          </div>
          {/* >> Exit */}
          {/* >> Exit --> DESKTOP */}
          <div
            role="button"
            tabIndex={0}
            onClick={() => setModalToOpen(-1)}
            onKeyPress={() => setModalToOpen(-1)}
            className="shoppingModal__containt__up__button--desktop">
            <IconSvg
              myStyle="shoppingModal__containt__up__button--desktop--logo"
              icon="logos-cross"
            />
          </div>
        </div>
        <div className="shoppingModal__containt__down">
          {/* >> Carousel */}
          <Swiper
            className="shoppingModal__containt__down__carousel"
            loop
            pagination={{ clickable: true }}
            modules={[Pagination]}>
            <SwiperSlide>
              <img
                className="shoppingModal__containt__down__carousel--img"
                src={item?.image1}
                alt={item?.title}
              />
            </SwiperSlide>
            <SwiperSlide>
              <img
                className="shoppingModal__containt__down__carousel--img"
                src={item?.image2}
                alt={item?.title}
              />
            </SwiperSlide>
          </Swiper>
          {/* >> Item Description  */}
          <p className="shoppingModal__containt__down__desc">{item?.description}</p>
          {/* >> Exit --> MOBILE */}
          <div
            role="button"
            tabIndex={0}
            onClick={() => setModalToOpen(-1)}
            onKeyPress={() => setModalToOpen(-1)}
            className="shoppingModal__containt__down__button--mobile">
            Retour
          </div>
        </div>
      </div>
    </div>
  );
};

export default ShoppingModal;
