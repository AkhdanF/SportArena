import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const WelcomeButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.greenAccent,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
        elevation: 5,
        shadowColor: Colors.greenAccent.withOpacity(0.5),
      ),
      child: Text(text),
    );
  }
}
