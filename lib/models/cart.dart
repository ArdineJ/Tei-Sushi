import 'package:flutter/material.dart';
import 'package:sushi/models/sushi.dart';

class CartItem {
  final Sushi sushi;
  int quantity;

  CartItem({required this.sushi, required this.quantity});
}

class Cart extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItemsCart(Sushi sushi, int quantity) {
    _items.add(CartItem(sushi: sushi, quantity: quantity));
    notifyListeners();
  }

  void removeItem(Sushi sushi) {
    _items.removeWhere((item) => item.sushi == sushi);
    notifyListeners();
  }

  void updateCartItemQuantity(int index, int newQuantity) {
    if (index >= 0 && index < _items.length) {
      _items[index].quantity = newQuantity;
      notifyListeners();
    }
  }
}
