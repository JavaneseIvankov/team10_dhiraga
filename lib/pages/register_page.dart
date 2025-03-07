import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? selectedRole;

  void registerUser() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Password tidak cocok!")));
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Registrasi Berhasil!")));
      Navigator.pop(
        context,
      ); // Kembali ke halaman login setelah registrasi sukses
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registrasi Gagal: ${e.toString()}")),
      );
    }
  }

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
        CustomTextField(label: "E-mail", controller: emailController),
        SizedBox(height: 10),
        CustomTextField(
          label: "Password",
          isPassword: true,
          controller: passwordController,
        ),
        SizedBox(height: 10),
        CustomTextField(
          label: "Confirm Password",
          isPassword: true,
          controller: confirmPasswordController,
        ),
        SizedBox(height: 20),
        CustomButton(
          text: "Register",
          onPressed: registerUser,
          isActive: true,
          intent: 'primary',
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Sudah punya akun?",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                TextSpan(
                  text: " Login",
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
