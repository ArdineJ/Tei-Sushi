import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/counter.dart';
import '../components/my_button.dart';
import '../models/cart.dart';
import '../models/sushi.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int qty = 0;

  void decrementQty() {
    setState(() {
      if (qty > 0) {
        qty--;
      }
    });
  }

  void incrementQty() {
    setState(() {
      qty++;
    });
  }

  void addToCart() {
    if (qty > 0) {
      final cart = context.read<Cart>();
      final sushi = ModalRoute.of(context)!.settings.arguments as Sushi;

      cart.addItemsCart(sushi, qty);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Icons.close_rounded),
                ],
              ),
              Text(
                'Successfully added to cart',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/menupage');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final sushi = ModalRoute.of(context)!.settings.arguments as Sushi;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListView(
                    children: [
                      Image.asset(
                        sushi.image,
                        height: 250,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[700],
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            sushi.rating.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        sushi.name,
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Description',
                        style: GoogleFonts.lato(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        sushi.description,
                        style: GoogleFonts.lato(
                            color: Colors.grey[600], height: 2),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(30)),
                  color: Colors.red[400],
                ),
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          sushi.price.toString(),
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                        Counter(
                          qty: qty,
                          onDecrement: decrementQty,
                          onIncrement: incrementQty,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    MyButton(
                      txt: 'Add to Cart',
                      onTap: addToCart,
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 111, 111, 111),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Color.fromARGB(255, 111, 111, 111),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
            ),
          ),
        ],
      ),
    );
  }
}
