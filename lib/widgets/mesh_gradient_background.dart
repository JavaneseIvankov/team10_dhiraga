import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  Widget _buildGradient({
    required Color color,
    double size = 300,
    double? top,
    double? right,
    double? left,
    double? bottom,
  }) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: color, blurRadius: 80, spreadRadius: 1)],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints.loose(
        size,
      ), // Ensure the Stack has constraints
      child: Stack(
        children: [
          // Use _buildGradient for the first circle
          _buildGradient(
            color: AppColors.radialGradient2.colors.last.withAlpha(120),
            size: 300,
            top: -150,
            right: -150,
          ),

          // Use _buildGradient for the second circle
          _buildGradient(
            color: AppColors.radialGradient1.colors.last.withAlpha(120),
            size: 300,
            left: -200,
            bottom: 300,
          ),

          // Use _buildGradient for the third circle
          _buildGradient(
            color: AppColors.radialGradient3.colors.last.withAlpha(120),
            size: 300,
            bottom: -200,
            right: -150,
          ),

          // Child widget in the center
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
