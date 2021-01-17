import React from "react";
import { formattedPrice } from './helpers';

const CartItem = (props) => {
  return (
    <tr>
      <td>
        <img src={props.imageUrl} alt={`Small image of ${props.name}`} />
      </td>
      <td>
        <h4>{props.name}</h4>
      </td>
      <td>{formattedPrice(props.unitPriceCents)}</td>
      <td>
        <button className="decrement" onClick={() => props.decrementItem(props.id)}> - </button>
        {props.quantity}
        <button className="increment" onClick={() => props.incrementItem(props.id)}> + </button>
      </td>
      <td>{formattedPrice(props.unitPriceCents * props.quantity)}</td>
    </tr>
  );
};

export default CartItem;
