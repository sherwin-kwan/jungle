import React from "react";
import PropTypes from "prop-types";
import MenuItem from './MenuItem';

const Menu = (props) => {

  const dishes = props.data.map(dish => {
    return (
      <MenuItem data={dish} />
    );
  });
  return (

    <div className="menu">
      <header className="page-header" id="menu">
        <h1>Our Menu</h1>
      </header>
      <div className="products">
        {dishes}
      </div>
    </div>   
  );
};

export default Menu;
