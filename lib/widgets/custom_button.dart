import 'package:flutter/material.dart';

import 'package:team10_dhiraga/core/theme/app_color.dart';
import 'package:team10_dhiraga/core/theme/app_theme.dart';
import 'package:team10_dhiraga/widgets/gradient_border.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String intent;
  final double? height;
  final double? width;
  final FontWeight? fontWeight;

  const CustomButton({
    required this.text,
    required this.onPressed,
    required this.intent,
    this.height,
    this.width,
    this.fontWeight,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var buttonStyle = AppTheme.primaryButtonStyle;
    var gradient = AppColors.gradient1;
    var textStyle = AppTheme.primaryTextStyle;
    var containerDecoration = BoxDecoration(
      gradient: gradient,
      borderRadius: BorderRadius.circular(40),
    );
    var hasGradientBorder = false;

    if (intent == 'primary') {
      buttonStyle = AppTheme.primaryButtonStyle;
      textStyle = AppTheme.primaryTextStyle;
      gradient = AppColors.gradient1;
      containerDecoration = BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(40),
      );
    } else if (intent == "disabled") {
      buttonStyle = AppTheme.disabledButtonStyle;
      textStyle = AppTheme.disabledTextStyle;
      containerDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: AppColors.grey, width: 2),
      );
    } else if (intent == "secondary") {
      buttonStyle = AppTheme.secondaryButtonStyle;
      textStyle = AppTheme.secondaryTextStyle.copyWith(
        backgroundColor: Colors.transparent,
      );
      hasGradientBorder = true;
      containerDecoration = BoxDecoration(
        gradient: AppColors.gradient1,
        borderRadius: BorderRadius.circular(40),
      );
    }

    Widget coreSection = Container(
      height: height,
      width: width,
      decoration: containerDecoration,
      // alignment: Alignment.center,
      child: TextButton(
        style: buttonStyle.copyWith(
          fixedSize: WidgetStateProperty.all(Size(width ?? 1, height ?? 0)),
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          child: Text(
            text,
            overflow: TextOverflow.visible,
            style: textStyle.copyWith(fontWeight: fontWeight),
          ),
        ),
      ),
    );

    if (hasGradientBorder) {
      return GradientBorder(borderRadius: 40, child: coreSection);
    }
    return coreSection;
  }
}
