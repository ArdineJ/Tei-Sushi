import 'package:flutter/material.dart';
import 'package:sushi/models/sushi.dart';

class CartItem {
  final Sushi sushi;
  int quantity;
  double totalPrice;

  CartItem(
      {required this.sushi, required this.quantity, required this.totalPrice});
}

class Cart extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double getTotalPrice() {
    double total = 0.0;
    for (var item in _items) {
      total += item.totalPrice;
    }
    return total;
  }

  void addItemsCart(Sushi sushi, int quantity) {
    var totalPrice = sushi.price * quantity;
    _items.add(
        CartItem(sushi: sushi, quantity: quantity, totalPrice: totalPrice));
    notifyListeners();
  }

  void removeItem(Sushi sushi) {
    _items.removeWhere((item) => item.sushi == sushi);
    notifyListeners();
  }

  void updateCartItemQuantity(Sushi sushi, int newQuantity) {
    var value = _items.firstWhere((item) => item.sushi == sushi);
    value.quantity = newQuantity;
    value.totalPrice = sushi.price * newQuantity;
    notifyListeners();
  }
}
