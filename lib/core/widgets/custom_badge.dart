import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';

class CustomBadge extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  const CustomBadge({
    super.key,
    required this.text,
    this.fontSize = 12,
    this.backgroundColor = DefaultColors.purple50,
    this.textColor = DefaultColors.purple500,
    this.borderRadius = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
