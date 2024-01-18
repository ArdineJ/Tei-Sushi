import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String txt;
  final void Function()? onTap;
  const MyButton({super.key, required this.txt, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 190, 190, 190),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                txt,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
