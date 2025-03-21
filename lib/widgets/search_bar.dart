import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';
import 'package:team10_dhiraga/widgets/custom_search_icon.dart';
import 'package:team10_dhiraga/widgets/custom_textfield.dart';
import 'package:team10_dhiraga/widgets/gradient_border.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String placeholder;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final TextStyle? labelStyle;
  final bool? autofocus;
  const CustomSearchBar({
    super.key,
    this.controller,
    this.placeholder = "",
    this.onChanged,
    this.onTap,
    this.labelStyle,
    this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    return GradientBorder(
      borderRadius: 32,
      borderWidth: 1,
      child: (TextField(
        autofocus: autofocus ?? false,
        onChanged: onChanged,
        onTap: onTap,
        controller: controller,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: labelStyle ?? const TextStyle(color: AppColors.grey),
          filled: true,
          fillColor: AppColors.background,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 2),
            child: CustomSearchButton(),
          ),
        ),
      )),
    );
  }
}
