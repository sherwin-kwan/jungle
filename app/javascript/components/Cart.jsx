import React from "react";
import PropTypes from "prop-types";
import CartItem from "./CartItem";

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
    console.log(`Cart is: `, this.props.cart);
    const items = this.props.cart.map(item => {
      return (
        <CartItem imageUrl={item.imageUrl} name={item.name} unitPriceCents={item.price_cents} quantity={item.quantity} />
      )
    });
    return (
      <>
        This is where the shopping cart goes. Items: <br />
        <table>
          <thead>
            <tr>
              <th colSpan="2">Dish</th>
              <th>Unit price</th>
              <th>Quantity</th>
              <th>Total price</th>
            </tr>
          </thead>
          <tbody>
            {items}
          </tbody>
        </table>
      </>
    );
  }
}

export default Cart;
