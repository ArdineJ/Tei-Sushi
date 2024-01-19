import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:provider/provider.dart';
import 'package:sushi/models/cart.dart';

import '../components/my_cart_items.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  getTotalPrice() {
    final cart = context.read<Cart>();
    var totalPrice = cart.getTotalPrice().toStringAsFixed(2);
    return totalPrice;
  }

  void removeAllItems() {
    final cart = context.read<Cart>();
    cart.removeAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.grey[900],
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                onPressed: removeAllItems,
                icon: const Icon(
                  Icons.remove_shopping_cart_rounded,
                  color: Color.fromARGB(255, 111, 111, 111),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.items.length,
                  itemBuilder: (context, index) {
                    CartItem cartItem = value.items[index];
                    return MyCartItems(
                      cart: cartItem,
                      onQtyChanged: (newQty) {
                        value.updateCartItemQuantity(cartItem.sushi, newQty);
                      },
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Share.share(
                      'Bayarin dong, cuman segini kok \$${value.getTotalPrice().toStringAsFixed(2)}');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.red[400],
                    ),
                    padding: const EdgeInsets.only(
                        top: 16.0, bottom: 16, left: 25, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total: \$${value.getTotalPrice().toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
