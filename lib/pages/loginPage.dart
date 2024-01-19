// ignore_for_file: file_names

import 'package:chatapp/components/CustomButton.dart';
import 'package:chatapp/components/TextField_Editor.dart';
import 'package:flutter/material.dart';

//TODO : BUTTON PAGE || REGISTRATION TEXT BUTTON || AUTHENTICATION

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //TODO LOGIN METHOD

  void login() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //* LOGO

            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(
              height: 20,
            ),

            //* TEXT

            Text(
              "Welcome Back",
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

            //* LOGIN BUTTON

            const SizedBox(
              height: 20,
            ),

            CustomButton(
              ButtonText: "Login",
              ontap: login,
            ),

            //* REGISTRATION BUTTON

            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member ? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  "Register now",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
