import React from "react";
import PropTypes from 'prop-types';

const CategoryItem = (props) => {
  return (
    <li className={(props.id === props.selectedId) ? "selected-category" : ""} 
      onClick={() => props.setCategory(props.id)}>
      {props.text}
    </li>
  );
};

CategoryItem.propTypes = {
  id: PropTypes.number,
  selectedId: PropTypes.number,
  setCategory: PropTypes.func,
  text: PropTypes.string
};

export default CategoryItem;