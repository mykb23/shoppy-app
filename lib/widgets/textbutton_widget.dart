import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  TextButtonWidget({
    Key? key,
    this.text,
    required this.color,
    this.size,
    this.weight,
    required this.tap,
  }) : super(key: key);
  final text;
  final Color color;
  final size;
  final weight;
  final VoidCallback tap;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: tap,
        child: Text(
          "$text",
          style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: weight,
          ),
        ),
      ),
    );
  }
}
