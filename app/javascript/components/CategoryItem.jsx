import React from "react";

const CategoryItem = (props) => {
  return (
    <li className={(props.id === props.selectedId) ? "category-item selected" : "category-item"} 
      onClick={() => props.setCategory(props.id)}>
      {props.text}
    </li>
  );
};

export default CategoryItem;