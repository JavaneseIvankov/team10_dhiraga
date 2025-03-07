import 'package:flutter/material.dart';

import 'package:team10_dhiraga/core/theme/app_color.dart';
import 'package:team10_dhiraga/core/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isActive;
  final String intent;
  final double? height;
  final double? width;

  const CustomButton({
    required this.text,
    required this.onPressed,
    required this.isActive,
    required this.intent,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle;
    final Gradient gradient;

    if (intent == 'primary') {
      buttonStyle =
          isActive
              ? AppTheme.primaryButtonStyle
              : AppTheme.primaryButtonStyle.copyWith(
                backgroundColor: MaterialStateProperty.all(AppColors.grey),
              );
      gradient = AppColors.gradient1;
    } else {
      buttonStyle =
          isActive
              ? AppTheme.secondaryButtonStyle
              : AppTheme.secondaryButtonStyle.copyWith(
                backgroundColor: MaterialStateProperty.all(AppColors.grey),
              );
      gradient = AppColors.gradient2;
    }

    return Container(
      height: height,
      width: width,
      // alignment: Alignment.center,
      decoration:
          isActive
              ? BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(40),
              )
              : null,
      child: TextButton(
        style: buttonStyle.copyWith(
          fixedSize: WidgetStateProperty.all(Size(width ?? 0, height ?? 0)),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              // vertical: (height ?? 0) / 4,
              vertical: 0,
              // horizontal: (width ?? 0) / 8,
              horizontal: 0,
            ),
          ),
        ),
        onPressed: isActive ? onPressed : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          child: Text(
            text,
            style: AppTheme.primaryTextStyle.copyWith(
              color: AppColors.background,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.visible,
            ),
          ),
        ),
      ),
    );
  }
}
