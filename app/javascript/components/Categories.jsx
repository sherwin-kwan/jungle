import React from "react";
import PropTypes from "prop-types";
import CategoryItem from "./CategoryItem";

class Categories extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedCategory: 0,
    };
    // Bind "this" to this class so setState is in scope
    this.setCategory = this.setCategory.bind(this);
  }
  setCategory(id) {
    this.setState({selectedCategory: id})
  }

  render() {

    const categories = this.props.data.map((category) => {
      return (
        <CategoryItem
          id={category.id}
          selectedId={this.state.selectedCategory}
          setCategory={this.setCategory}
          text={category.name}
        />
      );
    });

    return (
      <ul>
        <CategoryItem
          id={0}
          selectedId={this.state.selectedCategory}
          setCategory={this.setCategory}
          text="All"
        />
        {categories}
      </ul>
    );
  }
}

export default Categories;
