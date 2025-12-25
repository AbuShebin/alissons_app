import 'package:alissons_app/models/login_query_params_model.dart';
import 'package:alissons_app/models/user_model.dart';
import 'package:alissons_app/providers/login_providers.dart';
import 'package:alissons_app/screens/home_screen.dart';
import 'package:alissons_app/services/login_service/controller/login_controller.dart';
import 'package:alissons_app/services/login_service/repository/login_repository.dart';
import 'package:alissons_app/utils/theme/pallette.dart';
import 'package:alissons_app/widgets/custom_elevated_button.dart';
import 'package:alissons_app/widgets/customTextField_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final isObscureProvider = StateProvider<bool>((ref) => true);

  login({required WidgetRef ref}) async {
    try {
      final user = await ref.read(loginServiceProvider).login(
            emailphone: emailController.text,
            password: passwordController.text,
          );

      if (mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (e) {
      // Handle login error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${e.toString()}')),
        );
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/login_screen_image.jpg", width: w),
                  Positioned(
                    right: 1,
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: w * 0.048,
                              fontWeight: FontWeight.w200,
                              color: Palette.surfaceColor,
                              fontFamily: 'Lufga',
                            ),
                          ),
                        ),
                        Icon(Icons.chevron_right, color: Palette.surfaceColor),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.01),

              Padding(
                padding: const EdgeInsets.only(left: 9.0, right: 9),
                child: Column(
                  spacing: h * 0.02,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.04,
                      ),
                    ),
                    Text(
                      "Email Address",
                      style: TextStyle(
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomTextField(
                      labelText: "Email",
                      controller: emailController,
                      key: _formKey,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                            ).hasMatch(value)) {
                          return 'Enter a valid email!';
                        }
                        return null;
                      },
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) => CustomTextField(
                        labelText: "Password",
                        controller: passwordController,
                        isObscureText: ref.watch(isObscureProvider),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid password!';
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: () {
                            ref
                                .read(isObscureProvider.notifier)
                                .update((state) => !state);
                          },
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontSize: h * 0.015,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Center(
                      child: CustomElevatedButton(
                        text: "Login",
                        onPressed: () => login(ref: ref),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
