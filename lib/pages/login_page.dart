import 'package:flutter/material.dart';
import 'register_page.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3EAFD), Color(0xFFFFF1D7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(label: "Username"),
                SizedBox(height: 10),
                CustomTextField(label: "Password", isPassword: true),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Lupa Password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(text: "Login", onPressed: () {}),
                SizedBox(height: 10),
                Text("Atau Login dengan"),
                SizedBox(height: 10),
                IconButton(
                  icon: Image.asset(
                    "assets/google_icon.png",
                  ), // Tambahkan ikon Google di folder assets
                  iconSize: 40,
                  onPressed: () {},
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text(
                    "Belum punya akun? Register",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
