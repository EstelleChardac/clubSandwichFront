import './App.scss';
import '../src/sass/global/_index.scss';

import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Route, Routes, useLocation } from 'react-router-dom';

import IPage from '../src/interfaces/IPage';
import Loader from './components/global/Loader';
import Logo from './components/global/Logo';
import Navbar from './components/global/Navbar';
import Sound from './components/global/Sound';
import Bisous from './pages/Bisous';
import Club from './pages/Club';
import Dealers from './pages/Dealers';
import Home from './pages/Home';
import Infos from './pages/Infos';
import News from './pages/News';
import Shop from './pages/Shop';
import WallOfDwich from './pages/WallOfDwich';

const App = () => {
  //retrieve the route (useLocation)
  const location = useLocation();
  // create displayBackground variable and set to boolean
  let homePage: boolean = false;

  // this variable is true if location.pathname is either /, *, or /home
  if (
    location.pathname === '/' ||
    location.key === 'default' ||
    location.pathname === '/home'
  ) {
    homePage = true;
  }

  const [content, setContent] = useState<IPage>();

  const getContent = async () => {
    const url: string = `${import.meta.env.VITE_API_URL}/api/pages/41`;
    const { data } = await axios.get<IPage>(url);
    setContent(data);
  };

  useEffect(() => {
    getContent();
  }, []);

  const [loading, setLoading] = useState<boolean>(true);
  useEffect(() => {
    setTimeout(() => {
      setLoading(false);
    }, 2000);
  }, []);
  return loading ? (
    <div className="loadingGif">
      <Loader />
    </div>
  ) : (
    <div
      className="App"
      // only display background image if displayBackground is true
      style={
        homePage
          ? {
              backgroundImage: `url(${content?.image1})`,
              backgroundPosition: 'center',
              backgroundSize: 'cover',
              backgroundRepeat: 'no-repeat',
            }
          : {}
      }>
      <Sound />
      <Logo />

      {!homePage && <Navbar className="navbar" />}

      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/news" element={<News />} />
        <Route path="/club" element={<Club />} />
        <Route path="/dealers" element={<Dealers />} />
        <Route path="/wallofdwich" element={<WallOfDwich />} />
        <Route path="/shop" element={<Shop />} />
        <Route path="/infos" element={<Infos />} />
        <Route path="/bisous" element={<Bisous />} />
        <Route path="*" element={<Home />} />
      </Routes>
    </div>
  );
};

export default App;
