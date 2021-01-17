import React from "react";

const CategoryItem = (props) => {
  return (
    <li className={(props.id === props.selectedId) ? "selected-category" : ""} 
      onClick={() => props.setCategory(props.id)}>
      {props.text}
    </li>
  );
};

export default CategoryItem;