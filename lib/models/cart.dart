import 'package:flutter/material.dart';
import 'package:sneakertutorial/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Raging Bulls',
        description: 'Fire from the land of the 14s',
        price: '950.00',
        imagePath: 'lib/images/ragingbull14.png'),
    Shoe(
        name: 'Hyper',
        description: 'Whats bigger then the goat?',
        price: '675.00',
        imagePath: 'lib/images/hyper11s.png'),
    Shoe(
        name: 'Carbon Black',
        description: 'Air is the future',
        price: '1200.00',
        imagePath: 'lib/images/deepblack4s.png'),
    Shoe(
        name: 'Sac\' Home',
        description: 'Take a ride',
        price: '4200',
        imagePath: 'lib/images/sacremento3home.png'),
  ];

  // list of items in cart
  List<Shoe> cartItems = [];

  // get list of items for sale
  List<Shoe> getItemsForSale() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getCart() {
    return cartItems;
  }

  // user functions: add to cart, remove from cart
  void addToCart(Shoe shoe) {
    cartItems.add(shoe);
    notifyListeners();
  }

  void removeFromCart(Shoe shoe) {
    cartItems.remove(shoe);
    notifyListeners();
  }
}
