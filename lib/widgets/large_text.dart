import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';

class LargeText extends StatelessWidget {
  final String text;
  final FontStyle? fontStyle;
  const LargeText({super.key, required this.text, this.fontStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.primary ?? Colors.black,
      ).copyWith(fontStyle: fontStyle),
    );
  }
}
