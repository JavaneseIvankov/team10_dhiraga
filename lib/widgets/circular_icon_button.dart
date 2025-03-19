import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';
import 'package:team10_dhiraga/widgets/gradient_wrapper.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback onPressed;
  final bool isActive;

  const CircularIconButton({
    Key? key,
    required this.icon,
    required this.size,
    required this.onPressed,
    this.isActive = false, // Default to inactive state
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: isActive ? AppColors.gradient1 : null,
          color: isActive ? null : AppColors.background, // Inactive state color
        ),
        child: Center(
          child:
              isActive
                  ? Icon(icon, color: Colors.white, size: size * 0.5)
                  : GradientWrapper(
                    child: Icon(
                      icon,
                      color: AppColors.background,
                      size: size * 0.5,
                    ),
                  ),
        ),
      ),
    );
  }
}
