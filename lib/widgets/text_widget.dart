import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget({Key? key, this.text, required this.color, this.size, this.weight})
      : super(key: key);
  final text;
  final Color color;
  final size;
  final weight;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '$text',
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
        ),
      ),
    );
  }
}
