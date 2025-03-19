import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';

class GradientWrapper extends StatelessWidget {
  final Widget child;
  final Gradient gradient;

  const GradientWrapper({
    super.key,
    required this.child,
    this.gradient = AppColors.gradient1,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(bounds);
      },
      blendMode: BlendMode.srcIn,
      child: child,
    );
  }
}
