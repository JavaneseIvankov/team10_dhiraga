import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? selectedRole;

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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child:
                  selectedRole == null
                      ? buildRoleSelection()
                      : buildRegisterForm(),
            ),
          ),
        ),
      ),
    );
  }

  /// Tampilan awal untuk memilih role Student atau Mentor
  Widget buildRoleSelection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Register",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E40AF),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => setState(() => selectedRole = "Student"),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            backgroundColor: Color(0xFF1E40AF),
          ),
          child: Text(
            "Student",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        OutlinedButton(
          onPressed: () => setState(() => selectedRole = "Mentor"),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            side: BorderSide(color: Color(0xFF1E40AF)),
          ),
          child: Text(
            "Mentor",
            style: TextStyle(
              color: Color(0xFF1E40AF),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  /// Formulir pendaftaran Student atau Mentor
  Widget buildRegisterForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Register as a $selectedRole",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E40AF),
          ),
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
        CustomButton(
          text: "Register",
          onPressed: () {},
          isActive: true,
          intent: 'register',
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Sudah punya akun",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                TextSpan(
                  text: "? Login",
                  style: TextStyle(
                    color: Color(0xFF1E40AF),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
