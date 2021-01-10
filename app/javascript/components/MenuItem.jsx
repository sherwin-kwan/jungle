import React from "react";
import cRoll from "../images/uploads/product/image/01-california-roll.jpg";

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

  const imagePath = ".." + data.image.url;

  console.log('Data is: ', data);
  return (
  <article className="product">
    This is where the menu goes.
    <header>
      <a href="">
        <img alt={data.name} src={require(`${imagePath}`)} />
        <h4>{data.name}</h4>
      </a>
    </header>
    <span className="price">
      {formattedPrice(data.price_cents)}
    </span>
    <p className="description">
      {data.description}
    </p>
    {/* <footer class="actions">
      <%= button_to add_item_cart_path(product_id: product.id), disabled: product.quantity == 0, class: "btn btn-primary", method: :post do %>
        <i class="fas fa-shopping-cart"></i>Order
      <% end %>
      <%= link_to product, class: "btn btn-default pull-right" do %>
        Details &raquo;
      <% end %>
    </footer>
    <% if product.quantity == 0 %>
      <aside class="sold-out" title="Sorry, sold out for the day">
        SOLD OUT
      </aside>
    <% end %> */}
  </article>);
};

export default MenuItem;