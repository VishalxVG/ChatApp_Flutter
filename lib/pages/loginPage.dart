import 'package:chatapp/components/TextField_Editor.dart';
import 'package:flutter/material.dart';

//TODO : BUTTON PAGE || REGISTRATION TEXT BUTTON || AUTHENTICATION

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! LOGO

            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(
              height: 20,
            ),

            //! TEXT

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

            //* REGISTRATION
          ],
        ),
      ),
    );
  }
}
