// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:chatapp/services/auth/auth_services.dart';
import 'package:chatapp/components/CustomButton.dart';
import 'package:chatapp/components/TextField_Editor.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final void Function()? onTap;

  RegisterPage({super.key, this.onTap});

  void register(BuildContext context) {
    // auth service

    final _auth = AuthService();

    // password match -> create user

    if (passwordController.text == confirmPasswordController.text) {
      try {
        _auth.signUpWithEmailPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    }

    // password donot match -> give error

    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(
            "Password Doesnot Match",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //* LOGO

            Lottie.asset(
              "assets/animation/animation1.json",
            ),

            const SizedBox(
              height: 20,
            ),

            //* TEXT

            Text(
              "Lets create a account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //* EMAIL TEXT FIELD

            CustomTextField(
              hintText: "Email",
              obscureText: false,
              controller: emailController,
            ),

            const SizedBox(
              height: 20,
            ),

            //* PW TEXT FIELD

            CustomTextField(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
            ),

            const SizedBox(
              height: 20,
            ),

            //* ConfirmPW TEXT FIELD

            CustomTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: confirmPasswordController,
            ),

            //* REGISTRATION BUTTON

            const SizedBox(
              height: 20,
            ),

            CustomButton(
              ButtonText: "Register",
              ontap: () => register(context),
            ),

            //* LOGIN BUTTON

            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a member ? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
