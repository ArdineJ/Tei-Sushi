import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/models/cart.dart';

import '../components/my_cart_items.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'My Cart',
            style: GoogleFonts.lato(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/menupage',
              );
            },
          ),
        ),
        body: ListView.builder(
          itemCount: value.items.length,
          itemBuilder: (context, index) {
            CartItem cartItem = value.items[index];
            return MyCartItems(
              cart: cartItem,
              onQtyChanged: (newQty) {
                value.updateCartItemQuantity(index, newQty);
              },
            );
          },
        ),
      ),
    );
  }
}
