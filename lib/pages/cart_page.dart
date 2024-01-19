import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/my_button.dart';
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
              Container(
                // color: Colors.transparent,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red[400],
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: \$ ${value.getTotalPrice().toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Share.share(
                            "${value.getTotalPrice().toStringAsFixed(2)}");
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
