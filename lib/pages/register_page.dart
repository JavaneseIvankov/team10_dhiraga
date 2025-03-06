import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String role = "Student";

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
                  "Register as a",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceChip(
                      label: Text("Student"),
                      selected: role == "Student",
                      onSelected: (selected) {
                        setState(() {
                          role = "Student";
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    ChoiceChip(
                      label: Text("Mentor"),
                      selected: role == "Mentor",
                      onSelected: (selected) {
                        setState(() {
                          role = "Mentor";
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomTextField(label: "Full Name"),
                SizedBox(height: 10),
                CustomTextField(label: "E-mail"),
                SizedBox(height: 10),
                CustomTextField(label: "Username"),
                SizedBox(height: 10),
                CustomTextField(label: "Password", isPassword: true),
                SizedBox(height: 10),
                CustomTextField(label: "Confirm Password", isPassword: true),
                SizedBox(height: 20),
                CustomButton(text: "Register", onPressed: () {}),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Sudah punya akun? Login",
                    style: TextStyle(color: Colors.blue),
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
