import React from "react";
import PropTypes from "prop-types";
import MenuItem from './MenuItem';

const Menu = (props) => {

  const data = (props.category === 0) ? props.data : props.data.filter(val => val.category_id === props.category);

  const dishes = data.map(dish => {
    return (
      <MenuItem data={dish} incrementItem={props.incrementItem} />
    );
  });
  return (
    <>
      <header className="page-header" id="menu">
        <h1>Our Menu</h1>
      </header>
      <div className="products">
        {dishes}
      </div>
    </>   
  );
};

Menu.propTypes = {
  data: PropTypes.array,
  category: PropTypes.number,
  incrementItem: PropTypes.func
};

export default Menu;
