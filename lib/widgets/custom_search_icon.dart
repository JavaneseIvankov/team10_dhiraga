import 'package:flutter/material.dart';

class CustomSearchButton extends StatelessWidget {
  final double size;
  final VoidCallback? onTap;

  const CustomSearchButton({super.key, this.size = 40, this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        "assets/custom_search_icon.png",
        width: size,
        height: size,
      ),
      iconSize: size,
      onPressed: onTap,
    );
  }
}
