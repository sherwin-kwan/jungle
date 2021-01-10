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
        item_sample: 1,
      },
      category: 0,
    };
  }
  setCategory = (id) => {
    this.setState({ category: id });
  };

  render() {
    return (
      <>
        <div className="menu-section">
          <div className="categories">
            <Categories
              data={this.props.categories}
              category={this.state.category}
              setCategory={this.setCategory.bind(this)}
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
}

export default Base;
