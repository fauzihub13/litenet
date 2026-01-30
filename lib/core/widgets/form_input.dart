import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:flutter/services.dart';

class FormInput extends StatelessWidget {
  final TextEditingController textController;
  final String? hintText;
  final bool obscureText;
  final bool readOnly;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const FormInput({
    super.key,
    required this.textController,
    this.hintText,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.onChanged,
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
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
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
