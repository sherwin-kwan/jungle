import React from "react";
import PropTypes from "prop-types";
import CartItem from "./CartItem";
import axios from "axios";

class Cart extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    // this.timer = setInterval(() => {
    //   this.setState({items: {item: this.state.items.item + 1}});
    // }, 1000);
  }

  componentWillUnmount() {}

  render() {
    const items = this.props.cart.map((item) => {
      return (
        <CartItem
          imageUrl={item.imageUrl}
          name={item.name}
          unitPriceCents={item.price_cents}
          quantity={item.quantity}
        />
      );
    });
    const submitOrder = async (cart) => {
      try {
        const simpleCart = cart.map((item) => {
          return {
            id: item.id,
            price_cents: item.price_cents,
            quantity: item.quantity,
          };
        });
        console.log(simpleCart);
        const sendOrder = await axios.post("/cart/fill", simpleCart);
        if (sendOrder.data === "OK") {
          window.location.href = `/cart`;
        }
      } catch (err) {
        console.log("Errror: ", err.message);
      }
    };
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
          <tbody>{items}</tbody>
        </table>
        <button onClick={() => submitOrder(this.props.cart)}>Order Now</button>
      </>
    );
  }
}

export default Cart;
