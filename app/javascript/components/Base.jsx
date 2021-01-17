import React, { useState } from "react";
import PropTypes from "prop-types";
import Categories from "./Categories";
import Menu from "./Menu";
import Cart from "./Cart";

const Base = (props) => {
  const [category, setCategory] = useState(0);
  const [cart, setCart] = useState([]);

  const decrementItem = (id) => {
    console.log('Attempting to decrement ', id);
    const itemInCart = cart.findIndex(item => item.id === id);
    console.log(itemInCart, 'item in cart');
    if (itemInCart === -1) {
      console.log('Error: Item already not in cart');
    } else {
      setCart(prev => prev.map(prevItem => {
        if (prevItem.id === id) {
          return (prevItem.quantity === 1) ? {} : {
            id,
            name: prevItem.name,
            imageUrl: prevItem.imageUrl,
            price_cents: prevItem.price_cents,
            quantity: prevItem.quantity - 1
          };
        } else return prevItem;
      }
      ));
    }
  };

  const incrementItem = (id, name, price_cents, image_tiny_url) => {
    const itemInCart = cart.findIndex(item => item.id === id);
    if (itemInCart === -1) {
      console.log('NEW');
      setCart([...cart, {
        id,
        name,
        imageUrl: image_tiny_url,
        price_cents,
        quantity: 1
      }]);
    } else {
      console.log('ALREADY THERE');
      setCart(prev => prev.map(prevItem => {
        if (prevItem.id === id) {
          return {
            id, 
            name,
            imageUrl: image_tiny_url,
            price_cents,
            quantity: prevItem.quantity + 1
          }
        } else return prevItem;
      }
      ));
    }
  };

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
          <Menu data={props.products} category={category} incrementItem={incrementItem} />
        </div>
      </div>
      <div className="cart-section">
        <Cart cart={cart} setCart={setCart} decrementItem={decrementItem} incrementItem={incrementItem} />
      </div>
    </>
  );
};

export default Base;
