import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';

class EmptyState extends StatelessWidget {
  final String message;
  final bool isRefreshable;

  const EmptyState({
    super.key,
    required this.message,
    this.isRefreshable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isRefreshable) {
      return CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: EmptyState(message: message),
          ),
        ],
      );
    } else {
      return Center(
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: DefaultColors.black200,
          ),
        ),
      );
    }
  }
}
