import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/counter.dart';
import 'package:sushi/models/cart.dart';
import 'package:sushi/models/sushi.dart';

class MyCartItems extends StatefulWidget {
  final CartItem cart;
  final Function(int) onQtyChanged;

  MyCartItems({Key? key, required this.cart, required this.onQtyChanged})
      : super(key: key);

  @override
  State<MyCartItems> createState() => _MyCartItemsState();
}

class _MyCartItemsState extends State<MyCartItems> {
  String calculateTotalPrice() {
    return (widget.cart.sushi.price * widget.cart.quantity).toStringAsFixed(2);
  }

  void removeItem(Sushi sushi) {
    final cart = context.read<Cart>();
    if (widget.cart.quantity == 0) {
      cart.removeItem(sushi);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red[400],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.cart.sushi.image,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cart.sushi.name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '\$${calculateTotalPrice()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Counter(
              qty: widget.cart.quantity,
              onDecrement: () {
                if (widget.cart.quantity == 1) {
                  widget.onQtyChanged(widget.cart.quantity - 1);
                  removeItem(widget.cart.sushi);
                }

                if (widget.cart.quantity > 0) {
                  widget.onQtyChanged(widget.cart.quantity - 1);
                }
              },
              onIncrement: () {
                widget.onQtyChanged(widget.cart.quantity + 1);
              },
            )
          ],
        ),
      ),
    );
  }
}
