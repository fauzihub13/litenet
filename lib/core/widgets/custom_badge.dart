import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';

class CustomBadge extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final FontWeight fontWeight;
  final double paddingVertical;
  final double paddingHorizontal;

  const CustomBadge({
    super.key,
    required this.text,
    this.fontSize = 12,
    this.backgroundColor = DefaultColors.purple50,
    this.textColor = DefaultColors.purple500,
    this.borderRadius = 4,
    this.fontWeight = FontWeight.bold,
    this.paddingVertical = 2,
    this.paddingHorizontal = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
