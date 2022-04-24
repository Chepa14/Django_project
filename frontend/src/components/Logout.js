import React, { useState, useEffect, Fragment } from 'react';
import {logout} from "../requests/requests";

const Logout = () => {
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (localStorage.getItem('token') == null) {
      window.location.replace('http://localhost:8000/login');
    } else {
      setLoading(false);
    }
  }, []);

  const handleLogout = async e => {
    e.preventDefault();

    await logout(localStorage.getItem('token'))
  };

  return (
    <div>
      {loading === false && (
        <Fragment>
          <h1>Are you sure you want to logout?</h1>
          <input type='button' value='Logout' onClick={handleLogout} />
        </Fragment>
      )}
    </div>
  );
};

export default Logout;
