import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/components/my_button.dart';

class PromoBox extends StatelessWidget {
  final String sushiImg;
  final String disc;
  const PromoBox({super.key, required this.sushiImg, required this.disc});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.red.shade500, Colors.red.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Get $disc Promo',
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  MyButton(
                    txt: 'Redeem',
                    onTap: () {},
                  )
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                sushiImg,
                height: 120,
              ),
            )
          ],
        ),
      ),
    );
  }
}
