import React, { useState } from "react";
import PropTypes from "prop-types";
import Categories from "./Categories";
import Menu from "./Menu";
import Cart from "./Cart";

const Base = (props) => {

  [category, setCategory] = useState(0);
  [cart, setCart] = useState(0);

    return (
      <>
        <div className="menu-section">
          <div className="categories">
            <Categories
              data={props.categories}
              category={category}
              setCategory={setCategory}
            />
          </div>
          <div className="menu">
            <Menu data={this.props.products} />
          </div>
        </div>
        <div className="cart-section">
          <Cart />
        </div>
      </>
    );
}

export default Base;
