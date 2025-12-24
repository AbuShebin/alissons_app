import 'package:alissons_app/screens/home_screen.dart';
import 'package:alissons_app/widgets/custom_elevated_button.dart';
import 'package:alissons_app/widgets/customTextField_common.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email == "mobile@alisonsgroup.com" && password == "12345678") {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/login_screen_image.jpg",
                width: w,
                height: h * 0.5,
              ),
        
              Padding(
                padding: const EdgeInsets.only(left: 9.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: h * 0.02,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: "Lufga",
                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.04,
                      ),
                    ),
                    Text(
                      "Email Address",
                      style: TextStyle(
                        fontFamily: "Lufga",
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomTextField(
                      labelText: "Email",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontFamily: "Lufga",
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomTextField(
                      labelText: "Password",
                      controller: passwordController,
                      isObscureText: true,
                    ),
                    Center(
                      child: CustomElevatedButton(
                        text: "Login",
                        onPressed: _login,
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
