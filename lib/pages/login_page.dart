import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';
import 'package:team10_dhiraga/features/presentation/providers/auth_provider.dart';
import 'package:team10_dhiraga/widgets/large_text.dart';
import 'package:team10_dhiraga/widgets/mesh_gradient_background.dart';
import 'register_page.dart';
import 'Navbar_home_page.dart/home_page.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';
import 'package:team10_dhiraga/core/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final ValueNotifier<bool> _legibleSubmission;
  var errorMessage = "";

  @override
  void initState() {
    super.initState();
    _legibleSubmission = ValueNotifier(false);

    emailController.addListener(_setSubmissionLegibility);
    passwordController.addListener(_setSubmissionLegibility);
  }

  void _setSubmissionLegibility() {
    bool status =
        (emailController.text.isNotEmpty && passwordController.text.isNotEmpty);
    _legibleSubmission.value = status;
  }

  void _login(MyAuthProvider authProvider) {
    if (authProvider.isLoading && !_legibleSubmission.value) return;
    authProvider.login(
      email: emailController.text,
      password: passwordController.text,
      onSuccess: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      onFailed:
          (_) => setState(() {
            errorMessage = "Login gagal, coba lagi!";
          }),
    );
  }

  Widget _buildLoginButton(BuildContext context, MyAuthProvider authProvider) {
    return ValueListenableBuilder<bool>(
      valueListenable: _legibleSubmission,
      builder:
          (context, value, child) => CustomButton(
            intent: value ? 'primary' : 'disabled',
            text: 'Login',
            width: 240,
            height: 50,
            onPressed: () => _login(authProvider),
            fontWeight: FontWeight.w700,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<MyAuthProvider>(context);

    return Scaffold(
      body: GradientBackground(
        child: Container(
          decoration: const BoxDecoration(),
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
                      label: "E-mail",
                      placeholder: "johndoe@gmail.com",
                      controller: emailController,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      label: "Password",
                      placeholder: "Keep it secret!",
                      isPassword: true,
                      controller: passwordController,
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("Lupa Password?"),
                    ),
                    SizedBox(height: 20),
                    _buildLoginButton(context, authProvider),
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child:
                          (authProvider.errorMessage.isNotEmpty)
                              ? Text(
                                authProvider.errorMessage,
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
      ),
    );
  }
}
