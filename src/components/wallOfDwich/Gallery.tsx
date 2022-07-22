import React from 'react';

import IPage from '../../interfaces/IPage';

interface GalleryProps {
  data: Array<IPage>;
}

const Gallery = ({ data }: GalleryProps) => {
  return (
    <>
      <div className="gallery__allGrid">
        <div className="gallery__allGrid__container">
          {data &&
            data.sort().map((image, index) => (
              <div
                className={`gallery__allGrid__container__div gallery__allGrid__container__div--${
                  (index % 7) + 1
                }`}
                key={image.id}>
                <div>
                  <h2>{image.author}</h2>
                </div>
                <img src={image.image1} alt="imm1" />
              </div>
            ))}
        </div>
      </div>
    </>
  );
};

export default Gallery;
