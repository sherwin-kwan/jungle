import React from "react";
import PropTypes from "prop-types";
import CartItem from "./CartItem";
import axios from "axios";
import { formattedPrice } from './helpers';

class Cart extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
  }

  componentWillUnmount() {}

  render() {
    const items = this.props.cart.map((item) => {
      return (
        <CartItem
          id={item.id}
          imageUrl={item.imageUrl}
          name={item.name}
          cart={this.props.cart}
          setCart={this.props.setCart}
          unitPriceCents={item.price_cents}
          quantity={item.quantity}
          incrementItem={this.props.incrementItem}
          decrementItem={this.props.decrementItem}
        />
      );
    });
    const subtotal = formattedPrice(this.props.cart.reduce((acc, item) => {
      return acc + item.price_cents * item.quantity;
    }, 0));
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
        <h3>YOUR ORDER</h3>
        <br />
        {this.props.cart.length ? (
          <>
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
              <tfoot>
                <tr>
                  <td colSpan="4">TOTAL</td>
                  <td>{subtotal}</td>
                </tr>
              </tfoot>
            </table>
            <button onClick={() => submitOrder(this.props.cart)}>
              Order Now
            </button>
          </>
        ) : (
          <p>Click "Add" above to start adding dishes to your order!</p>
        )}
      </>
    );
  }
};

Cart.propTypes = {
  decrementItem: PropTypes.func,
  incrementItem: PropTypes.func,
  cart: PropTypes.array,
  setCart: PropTypes.func
};

export default Cart;
