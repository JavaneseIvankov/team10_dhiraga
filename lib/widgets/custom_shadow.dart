import 'package:flutter/material.dart';

class CustomShadow extends StatelessWidget {
  final Widget child;
  final Color color;
  final double blurRadius;
  final double spreadRadius;
  final Offset offset;

  const CustomShadow({
    super.key,
    required this.child,
    this.color = Colors.black12,
    this.blurRadius = 4.0,
    this.spreadRadius = 2.0,
    this.offset = const Offset(0, 5),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
            offset: offset,
          ),
        ],
      ),
      child: child,
    );
  }
}
