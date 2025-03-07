import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';
import 'package:team10_dhiraga/features/presentation/providers/auth_provider.dart';
import 'package:team10_dhiraga/widgets/large_text.dart';
import 'register_page.dart';
import 'home_page.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';
import 'package:team10_dhiraga/core/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

// TODO: Improve auth, use
class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;
  bool isActive = true;
  String errorMessage = '';

  void _login() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (_) {
      setState(() {
        errorMessage = "Login gagal, coba lagi.";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  late final ValueNotifier<bool> _legibleSubmission;

  @override
  void initState() {
    super.initState();
    _legibleSubmission = ValueNotifier(false);

    // Combine the text fields initially and update when either of them changes
    emailController.addListener(_updateCombinedText);
    passwordController.addListener(_updateCombinedText);
  }

  void _updateCombinedText() {
    bool status =
        (emailController.text.isNotEmpty && passwordController.text.isNotEmpty);
    _legibleSubmission.value = status;
  }

  Widget _buildLoginButton(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _legibleSubmission,
      builder:
          (context, value, child) => CustomButton(
            intent: value ? 'primary' : 'disabled',
            text: 'Login',
            width: 240,
            height: 50,
            onPressed: () {
              isLoading ? () {} : _login();
            },
            fontWeight: FontWeight.w700,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3EAFD), Color(0xFFFFF1D7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LargeText(text: 'Login'),
                  SizedBox(height: 20),
                  CustomTextField(
                    label: "Username",
                    controller: emailController,
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    label: "Password",
                    isPassword: true,
                    controller: passwordController,
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("Lupa Password?"),
                  ),
                  SizedBox(height: 20),
                  _buildLoginButton(context),
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child:
                        (errorMessage.isNotEmpty)
                            ? Text(
                              errorMessage,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            )
                            : null,
                  ),

                  const SizedBox(height: 10),
                  const Text("Atau Login dengan"),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Image.asset("assets/google_icon.png"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Belum punya akun? ",
                        style: AppTheme.secondaryTextStyle.copyWith(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "Register",
                            style: AppTheme.secondaryTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
