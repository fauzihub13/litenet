import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';

extension SnackbarExtension on BuildContext {
  void showError(String message) {
    _showSnackbar(message, backgroundColor: DefaultColors.lightRed);
  }

  void showSuccess(String message) {
    _showSnackbar(message, backgroundColor: DefaultColors.lightGreen);
  }

  void showInfo(String message) {
    _showSnackbar(message, backgroundColor: DefaultColors.purple300);
  }

  void showWarn(String message) {
    _showSnackbar(message, backgroundColor: DefaultColors.lightYellow);
  }

  void _showSnackbar(
    String message, {
    Color backgroundColor = DefaultColors.black200,
  }) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        elevation: 100,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
