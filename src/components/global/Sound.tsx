import React, { useState } from 'react';
import ReactPlayer from 'react-player';

const Sound = () => {
  // state variable to define if music is playing or not
  const [isPlaying, setIsPlaying] = useState<boolean>(false);
  // function to revert the value of the variable
  const handleChange = () => {
    setIsPlaying(!isPlaying);
  };

  return (
    <>
      <div className="sound">
        <div className="sound__soundcheck">
          {/* if the button is clicked, the box becomes white */}
          <div
            role="button"
            tabIndex={0}
            onKeyPress={handleChange}
            className={
              isPlaying ? 'sound__soundcheck__box--active' : 'sound__soundcheck__box'
            }
            // when clicking on the div, the value of isPlaying changes
            onClick={handleChange}>
            {/* integrating the React player input and hiding it */}
            <ReactPlayer
              url="https://soundcloud.com/elsa-rampazzo/sets/club-sandwich"
              width="0"
              height="0"
              playing={isPlaying}
              volume={0.3}
            />
          </div>
        </div>
        <span className="sound__soundcheck__title">SOUND</span>
      </div>
    </>
  );
};

export default Sound;
