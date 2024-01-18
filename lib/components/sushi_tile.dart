import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/models/sushi.dart';

class SushiTile extends StatelessWidget {
  final Sushi sushi;
  final void Function()? onTap;

  SushiTile({Key? key, required this.sushi, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: Image.asset(
                  sushi.image,
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                sushi.name,
                style: GoogleFonts.dmSerifDisplay(fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sushi.price.toString(),
                      style: GoogleFonts.lato(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                        ),
                        Text(
                          sushi.rating.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
