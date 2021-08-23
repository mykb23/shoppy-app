import 'package:flutter/material.dart';
import 'package:shoppy_app/utils/colors.dart';
import 'package:shoppy_app/widgets/text_widget.dart';
import 'package:shoppy_app/widgets/textbutton_widget.dart';

class HeadingText extends StatelessWidget {
  HeadingText({
    Key? key,
    required this.text,
    required this.bText,
    required this.tap,
  }) : super(key: key);
  final text;
  final bText;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: text,
          color: dark,
          size: 25.0,
          weight: FontWeight.w700,
        ),
        TextButtonWidget(
          text: bText,
          color: primary,
          size: 15.0,
          weight: FontWeight.w400,
          tap: tap,
        )
      ],
    );
  }
}
