import { Controller } from 'stimulus';

class Choose_Category extends Controller {
  static targets = ['category'];

  initialize() {
    this.index = 0;
    
  }
}