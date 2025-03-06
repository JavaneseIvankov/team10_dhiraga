import 'package:flutter/material.dart';
import 'page/login_page.dart'; // Import halaman login

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFB3E5FC), // Biru pastel utama
        scaffoldBackgroundColor: Color(0xFFE3F2FD), // Latar belakang lebih soft
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF81D4FA), // Warna AppBar
          elevation: 0, // Menghilangkan bayangan
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF81D4FA), // Warna tombol
            foregroundColor: Colors.white, // Warna teks tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ), // Membuat sudut tombol lebih lembut
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Color(0xFF0288D1), // Warna teks tombol "Daftar"
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
