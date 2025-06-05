import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed; // Now accepts any function, even with parameters via closure
  final String text;
  final Color fontColor;
  final Color buttonColor;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.fontColor,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: fontColor,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      child: Text(
        text,
        style: TextStyle(color: fontColor), // use passed color instead of fixed black
      ),
    );
  }
}
