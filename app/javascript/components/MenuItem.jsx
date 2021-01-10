import React from "react";

const MenuItem = (props) => {
  const { data } = props;

  const formattedPrice = (price_cents) => {
    const cents = String(price_cents);
    if (cents.length > 2) {
      return `$${cents.slice(0, cents.length - 2)}.${cents.slice(cents.length - 2)}`
    } else if (cents.length === 2) {
      return `$0.${cents}`;
    } else {
      return `$0.0${cents}`;
    }
  };

  const soldOut = (
  <aside class="sold-out" title="Sorry, sold out for the day">
    SOLD OUT
  </aside>);

  // Manually form RESTful url since we're not in Rails anymore
  const detailsUrl = "/products/" + String(data.id);

  console.log('Data is: ', data);
  return (
  <article className="product">
    <header>
      <a href="">
        <img alt={data.name} src={data.image_url} />
        <h4>{data.name}</h4>
      </a>
    </header>
    <span className="price">
      {formattedPrice(data.price_cents)}
    </span>
    <p className="description">
      {data.description}
    </p>
    <footer class="actions">
      <button>
        <i class="fas fa-shopping-cart"></i>Order
      </button>
      <a href={detailsUrl}>Details &gt;&gt;</a>
    </footer>
    {data.quantity === 0 && soldOut}
  </article>);
};

export default MenuItem;