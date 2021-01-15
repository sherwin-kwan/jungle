import React from "react";
import PropTypes from "prop-types";

class Cart extends React.Component {

  constructor(props) {
    super(props);
    
  }

  componentDidMount() {
    // this.timer = setInterval(() => {
    //   this.setState({items: {item: this.state.items.item + 1}});
    // }, 1000);
  }

  componentWillUnmount() {

  }

  render () {
    const items = 90;
    return (
      <>
        This is where the shopping cart goes. Items: {items}
      </>
    );
  }
}

export default Cart;
