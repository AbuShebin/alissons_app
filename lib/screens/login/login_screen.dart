import 'package:alissons_app/screens/home_screen.dart';
import 'package:alissons_app/utils/theme/pallette.dart';
import 'package:alissons_app/widgets/custom_elevated_button.dart';
import 'package:alissons_app/widgets/customTextField_common.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
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
                CustomTextField(labelText: "Email"),
                Text(
                  "Password",
                  style: TextStyle(
                    fontFamily: "Lufga",
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CustomTextField(labelText: "Password"),
                Center(
                  child: CustomElevatedButton(
                    text: "Login",
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
