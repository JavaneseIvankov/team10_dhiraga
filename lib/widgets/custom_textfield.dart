import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String placeholder;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.placeholder,
    this.isPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          textAlign: TextAlign.left,
          // style: TextStyle(fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 5),
        TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            labelText: widget.placeholder,
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
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.grey,
                      ),
                      onPressed: _togglePasswordVisibility,
                    )
                    : null,
          ),
        ),
      ],
    );
  }
}
