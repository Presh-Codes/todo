import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButtons(
    {
      super.key,
      required this.text,
      required this.onPressed,
    }
  );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.deepOrange,
      child: Text(text),
    );
  }
}