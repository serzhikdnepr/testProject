import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GlobalBtn extends StatelessWidget {
  const GlobalBtn({super.key, required this.text, required this.onTap});

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GFButton(
      fullWidthButton: true,
      size: 52,
      shape: GFButtonShape.pills,
      type: GFButtonType.outline2x,
      onPressed: onTap,
      text: text,
      textStyle:
          const TextStyle(color: GFColors.PRIMARY, fontWeight: FontWeight.w600),
    );
  }
}
