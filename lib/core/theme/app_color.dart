import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF182BC2);
  static const Color secondary = Color(0xFF629EFF);
  static const Color background = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF1D2331);
  static const Color grey = Color(0xFFD0CFD4);
  static const Color alternative1 = Color(0xFFF3B627);
  static const Color alternative2 = Color(0xFFFFECA2);

  static const LinearGradient gradient1 = LinearGradient(
    colors: [Color(0xFF182BC2), Color(0xFF629EFF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient gradient2 = LinearGradient(
    colors: [Color(0xFF182BC2), Color(0xFF629EFF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient gradient3 = LinearGradient(
    colors: [Color(0xFFF3B627), Color(0xFFF5CC28)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const RadialGradient radialGradient2 = RadialGradient(
    colors: [Color(0xFF182BC2), Color(0xFF629EFF)],
    radius: 0.85,
    center: Alignment.center,
  );

  static const RadialGradient radialGradient3 = RadialGradient(
    colors: [Color(0xFFF3B627), Color(0xFFF5CC28)],
    radius: 0.85,
    center: Alignment.center,
  );
}
