import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';
import 'package:team10_dhiraga/features/presentation/providers/auth_provider.dart';
import 'package:team10_dhiraga/widgets/mesh_gradient_background.dart';
import 'package:team10_dhiraga/widgets/large_text.dart';
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
  String? selectedRole;

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _registerUser(BuildContext context, MyAuthProvider authProvider) async {
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
    if (password != confirmPassword) {
      _showSnackbar("Password tidak cocok!");
      return;
    }

    authProvider.register(
      email: email,
      password: password,
      onSuccess: () {
        Navigator.pop(context);
      },
      onFailed: (_) {
        _showSnackbar("Registrasi gagal, coba lagi!");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<MyAuthProvider>(context);

    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child:
                  selectedRole == null
                      ? buildRoleSelection()
                      : buildRegisterForm(authProvider),
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
        LargeText(text: "Register as"),
        SizedBox(height: 20),
        CustomButton(
          width: 350,
          height: 46,
          text: "Student",
          intent: "primary",
          onPressed: () => setState(() => selectedRole = "Student"),
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 20),
        CustomButton(
          width: 350,
          height: 46,
          text: "Mentor",
          intent: "secondary",
          onPressed: () => setState(() => selectedRole = "Mentor"),
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget buildRegisterForm(MyAuthProvider authProvider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LargeText(text: "Register"),
        // SizedBox(height: 0),
        LargeText(
          text: "as a $selectedRole",
          textStyle: TextStyle(color: AppColors.black, fontSize: 24),
        ),
        SizedBox(height: 20),
        CustomTextField(
          label: "E-mail",
          placeholder: "johndoe@gmail.com",
          controller: emailController,
        ),
        SizedBox(height: 10),
        CustomTextField(
          label: "Password",
          placeholder: "Keep it secret!",
          isPassword: true,
          controller: passwordController,
        ),
        SizedBox(height: 10),
        CustomTextField(
          placeholder: "Make sure it matchesj",
          label: "Confirm Password",
          isPassword: true,
          controller: confirmPasswordController,
        ),
        SizedBox(height: 20),
        CustomButton(
          height: 50,
          width: 240,
          text: "Register",
          onPressed: () => _registerUser(context, authProvider),
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
