import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';

enum ButtonType { filled, outlined }

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final ButtonType buttonType;
  final bool isDisabled;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color borderColor;

  const Button({
    super.key,
    this.onPressed,
    required this.text,
    this.buttonType = ButtonType.filled,
    this.isDisabled = false,
    this.width = double.infinity,
    this.height,
    this.fontSize =16,
    this.borderColor = DefaultColors.purple500,
  });

  @override
  Widget build(BuildContext context) {
    final isFilled = buttonType == ButtonType.filled;

    if (isFilled) {
      return SizedBox(
        width: width,
        height: height ?? 55,
        child: ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isDisabled
                ? DefaultColors.purple100
                : DefaultColors.purple500,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: DefaultColors.white,
              fontWeight: FontWeight.w500,
              fontSize: fontSize

            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        width: width,
        height: height ?? 50,
        child: ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: isDisabled
                    ? Colors.transparent
                    : borderColor,
                width: 1.5,
              ),
            ),
            elevation: 0,
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: DefaultColors.purple500,
              fontWeight: FontWeight.w500,
              fontSize: fontSize
            ),
          ),
        ),
      );
    }
  }
}
