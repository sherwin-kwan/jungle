const fillCart = (cart, products) => {
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

export default fillCart;