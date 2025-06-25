import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final String val;
  final VoidCallback onPressed;

  const NumberButton({
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
          color: Colors.blueGrey,
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
