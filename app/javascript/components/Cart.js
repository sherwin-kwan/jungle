import React from "react"
import PropTypes from "prop-types"
class Cart extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      items: {item: 1}
    }
  }

  componentDidMount() {
    this.timer = setInterval(() => {
      this.setState({items: {item: this.state.items.item + 1}});
    }, 1000);
  }

  componentWillUnmount() {

  }

  render () {
    return (
      <>
        This is where the shopping cart goes. Items: {this.state.items.item}
      </>
    );
  }
}

export default Cart
