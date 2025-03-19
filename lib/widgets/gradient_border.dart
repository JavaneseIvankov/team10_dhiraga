import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';

class GradientBorder extends StatelessWidget {
  final Widget child;
  final double borderWidth;
  final double borderRadius;
  final Gradient gradient;

  const GradientBorder({
    super.key,
    required this.child,
    this.borderWidth = 2.0,
    this.borderRadius = 8.0,
    this.gradient = AppColors.gradient1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(borderWidth),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}
