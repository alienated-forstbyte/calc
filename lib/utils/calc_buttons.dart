import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String val;
  final VoidCallback onPressed;

  const CalcButton({
    super.key,
    required this.val,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox.expand( // ✅ Fills both width and height
        child: MaterialButton(
          onPressed: onPressed,
          color: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            val,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
