import React from 'react';
import { NavLink } from 'react-router-dom';

const Navbar = () => {
  return (
    <nav className="navbar">
      <NavLink
        className={(navData) =>
          navData.isActive ? 'navbar__link navbar__link--active' : 'navbar__link'
        }
        to="/">
        home
      </NavLink>
      <NavLink
        className={(navData) =>
          navData.isActive ? 'navbar__link navbar__link--active' : 'navbar__link'
        }
        to="/news">
        news
      </NavLink>
      <NavLink
        className={(navData) =>
          navData.isActive ? 'navbar__link navbar__link--active' : 'navbar__link'
        }
        to="/club">
        club
      </NavLink>
      <NavLink
        className={(navData) =>
          navData.isActive ? 'navbar__link navbar__link--active' : 'navbar__link'
        }
        to="/dealers">
        dealers
      </NavLink>
      <NavLink
        className={(navData) =>
          navData.isActive ? 'navbar__link navbar__link--active' : 'navbar__link'
        }
        to="/wallofdwich">
        wall of dwich
      </NavLink>
      <NavLink
        className={(navData) =>
          navData.isActive ? 'navbar__link navbar__link--active' : 'navbar__link'
        }
        to="/shop">
        shop
      </NavLink>
      <NavLink
        className={(navData) =>
          navData.isActive ? 'navbar__link navbar__link--active' : 'navbar__link'
        }
        to="/infos">
        infos
      </NavLink>
      <NavLink
        className={(navData) =>
          navData.isActive ? 'navbar__link navbar__link--active' : 'navbar__link'
        }
        to="/bisous">
        bisous
      </NavLink>
    </nav>
  );
};

export default Navbar;
