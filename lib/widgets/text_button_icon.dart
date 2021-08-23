import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  ButtonIcon(
      {Key? key,
      this.width,
      this.height,
      required this.radius,
      required this.color,
      required this.icon})
      : super(key: key);
  final width, height;
  final BorderRadius radius;
  final Color color;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: radius,
        color: color,
      ),
      child: icon,
    );
  }
}
