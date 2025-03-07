import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller; // Simpan sebagai properti

  CustomTextField({
    required this.label,
    this.isPassword = false,
    required this.controller, // Pastikan ini diinisialisasi
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // Gunakan controller di sini
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
