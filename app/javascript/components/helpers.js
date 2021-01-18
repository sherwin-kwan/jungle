export const fillCart = (cart, products) => {
  const filledCart = [];
  Object.keys(cart).forEach(key => {
    const myProduct = products.find(product => product.id == key);
    if (myProduct) {
      filledCart.push({
        id: key,
        name: myProduct.name,
        imageUrl: myProduct.image_tiny_url,
        price_cents: myProduct.price_cents,
        quantity: cart[key]
      });
    } else {
      console.log(`Unable to find product with ID ${key}`)
    }
  });
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
