import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';

class RowTitle extends StatelessWidget {
  final String title;
  const RowTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: DefaultColors.black400,
      ),
    );
  }
}
