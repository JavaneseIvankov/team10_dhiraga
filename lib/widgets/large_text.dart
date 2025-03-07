import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';

class LargeText extends StatelessWidget {
  final String text;
  final FontStyle? fontStyle;
  final TextStyle? textStyle;

  const LargeText({
    super.key,
    required this.text,
    this.fontStyle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.primary ?? Colors.black,
      ).copyWith(
        fontStyle: fontStyle,
        fontSize: textStyle?.fontSize,
        fontWeight: textStyle?.fontWeight,
        color: textStyle?.color,
        letterSpacing: textStyle?.letterSpacing,
        wordSpacing: textStyle?.wordSpacing,
        height: textStyle?.height,
        backgroundColor: textStyle?.backgroundColor,
        decoration: textStyle?.decoration,
        decorationColor: textStyle?.decorationColor,
        decorationStyle: textStyle?.decorationStyle,
        decorationThickness: textStyle?.decorationThickness,
        shadows: textStyle?.shadows,
      ),
    );
  }
}
