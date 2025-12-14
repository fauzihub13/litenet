import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:flutter/services.dart';

class FormInput extends StatelessWidget {
  final TextEditingController textController;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const FormInput({
    super.key,
    required this.textController,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: textController,
      validator: validator,
      inputFormatters: inputFormatters,
      style: Theme.of(
        context,
      ).textTheme.bodySmall?.copyWith(color: DefaultColors.black500),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixIconTap,
                child: suffixIcon,
              )
            : null,
      ),
    );
  }
}
