import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';

class CustomSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = AppColors.black,
    Color textColor = AppColors.background,
    SnackBarAction? action,
  }) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: textColor)),
      duration: duration,
      backgroundColor: backgroundColor,
      action: action,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
