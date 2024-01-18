import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Text(
                  'Tei Susi',
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 32,
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Image.asset('images/nigiri.png'),
                ),
                const SizedBox(height: 25),
                Text(
                  'AUTHENTIC TASTE OF JAPAN\'S FOOD',
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 40, color: Colors.white),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Feel the taste of the most popular Japanese Sushi',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
            MyButton(
              txt: 'Get Started',
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
