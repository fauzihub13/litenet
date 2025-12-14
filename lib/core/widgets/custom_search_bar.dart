import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';

class CustomSearchBar extends StatelessWidget {
  final String title;
  final VoidCallback? onFilterPressed;
  final VoidCallback? onSearchChanged;
  final ValueChanged<String>? onChanged;
  const CustomSearchBar({
    super.key,
    required this.title,
    this.onFilterPressed,
    this.onSearchChanged,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
      child: TextFormField(
        onChanged: onChanged,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: DefaultColors.black500),
        decoration: InputDecoration(
          hintText: title,

          prefixIcon: const Icon(Icons.search, size: 24),
          suffixIcon: IconButton(
            icon: const Icon(Icons.tune, size: 20),
            onPressed: onFilterPressed,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: DefaultColors.purple200,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: DefaultColors.purple500,
              width: 1.5,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
        ),
      ),
    );
  }
}
