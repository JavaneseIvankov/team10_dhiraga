import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String placeholder;
  final bool isPassword;

  CustomTextField({
    required this.controller,
    required this.label,
    required this.placeholder,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.left,
          // style: TextStyle(fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            labelText: placeholder,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: const TextStyle(color: AppColors.grey),
            filled: true,
            fillColor: AppColors.background,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: AppColors.grey, width: 2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.white, width: 10),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
          ),
        ),
      ],
    );
  }
}
