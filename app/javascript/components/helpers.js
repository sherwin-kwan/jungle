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