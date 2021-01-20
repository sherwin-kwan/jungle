import axios from "axios";

export const cancelOrder = async () => {
  try {
    const sendOrder = await axios.post("/cart/fill", []);
    if (!sendOrder.data === "OK") {
      throw new Error("Cart didn't empty");
    }
  } catch (err) {
    console.log("Errror: ", err.message);
  }
};

export const fillCart = (cart, products) => {
  const filledCart = [];
  if (Object.keys(cart)) Object.keys(cart).forEach((key) => {
    const myProduct = products.find((product) => product.id == key);
    if (myProduct) {
      filledCart.push({
        id: key,
        name: myProduct.name,
        imageUrl: myProduct.image_tiny_url,
        price_cents: myProduct.price_cents,
        quantity: cart[key],
      });
    } else {
      console.log(`Unable to find product with ID ${key}`);
    }
  });
  console.log('filled cart is ', filledCart);
  return filledCart;
};

export const formattedPrice = function (price_cents) {
  const cents = String(price_cents);
  if (cents.length > 2) {
    return `$${cents.slice(0, cents.length - 2)}.${cents.slice(
      cents.length - 2
    )}`;
  } else if (cents.length === 2) {
    return `$0.${cents}`;
  } else {
    return `$0.0${cents}`;
  }
};

export const submitOrder = async (cart) => {
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

export const subtotal = (cart) => {
  return formattedPrice(
    cart.reduce((acc, item) => {
      return acc + item.price_cents * item.quantity;
    }, 0)
  );
};
