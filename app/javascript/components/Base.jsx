import React from "react";
import PropTypes from "prop-types";
import Categories from "./Categories";
import Menu from "./Menu";
import Cart from "./Cart";

class Base extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      cart: {
        item_sample: 1
      }
    };
  };

  render () {
    return (
      <>
        <div className="menu-section">
          <div className="categories">
            <Categories data={this.props.categories} />
          </div>
          <div className="menu">
            <header className="page-header" id="menu">
              <h1>Our Menu</h1>
            </header>
            <div className="products">
              <Menu data={this.props.products} />
            </div>
          </div>
        </div>
        <div className="cart-section">
          <Cart />
        </div>
      </>
    );
  };
};

export default Base;
