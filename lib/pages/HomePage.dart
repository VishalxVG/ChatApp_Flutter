import 'package:chatapp/auth/auth_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  void logout() {
    // auth services
    final auth = AuthService();

    // signout
    auth.signOut();
  }

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          // logout button

          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
