import React, { useState } from "react";
import PropTypes from "prop-types";
import Categories from "./Categories";
import Menu from "./Menu";
import Cart from "./Cart";
import { fillCart } from "./helpers";

const Base = (props) => {
  const [category, setCategory] = useState(0);
  const [cart, setCart] = useState(
    fillCart(props.current_cart, props.products)
  );

  console.log('Cart is set to: ', cart);
  const decrementItem = (id) => {
    const itemInCart = cart.findIndex((item) => item.id === id);
    if (itemInCart === -1) {
      console.log("Error: Item already not in cart");
    } else {
      setCart((prev) =>
        prev.map((prevItem) => {
          console.log("Previtem is: ", prevItem);
          if (prevItem.id === id) {
            return {
              id,
              name: prevItem.name,
              imageUrl: prevItem.imageUrl,
              price_cents: prevItem.price_cents,
              quantity: prevItem.quantity - 1,
            };
          } else return prevItem;
        })
      );
      setCart((prev) => prev.filter((item) => item.quantity > 0));
    }
  };

  const incrementItem = (id, name, price_cents, image_tiny_url) => {
    const itemInCart = cart.findIndex((item) => item.id === id);
    if (itemInCart === -1) {
      setCart([
        ...cart,
        {
          id,
          name,
          imageUrl: image_tiny_url,
          price_cents,
          quantity: 1,
        },
      ]);
    } else {
      setCart((prev) =>
        prev.map((prevItem) => {
          if (prevItem.id === id) {
            return {
              id,
              name: prevItem.name,
              imageUrl: prevItem.imageUrl,
              price_cents: prevItem.price_cents,
              quantity: prevItem.quantity + 1,
            };
          } else return prevItem;
        })
      );
    }
  };
  return (
    <>
      <div className="menu-section">
        <main>
          <div className="categories">
            <Categories
              data={props.categories}
              category={category}
              setCategory={setCategory}
            />
          </div>
          <div className="menu">
            <Menu
              data={props.products}
              category={category}
              incrementItem={incrementItem}
            />
          </div>
        </main>
        <aside>
          {
            <Cart
              cart={cart}
              setCart={setCart}
              decrementItem={decrementItem}
              incrementItem={incrementItem}
            />
          }
        </aside>
      </div>
    </>
  );
};

Base.propTypes = {
  products: PropTypes.array,
  categories: PropTypes.array,
  current_cart: PropTypes.object,
};

export default Base;
