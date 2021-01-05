import React from "react";
import PropTypes from "prop-types";

class Menu extends React.Component {
  render () {
    return (
      <>
        <article className="product">
          This is where the menu goes.
          {/* <header>
            <%= link_to product do %>
              <%= image_pack_tag "media#{product.image.url}", alt: product.name %>
              <h4><%= product.name %></h4>
            <% end %>
          </header>
          <span class="price">
            <%= humanized_money_with_symbol product.price %>
          </span>
          <p class="description">
            <%= product.description %>
          </p>
          <footer class="actions">
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
        </article>
      </>
    );
  }
};

export default Menu;
