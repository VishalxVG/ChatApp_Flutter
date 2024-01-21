// ignore_for_file: file_names

import 'package:chatapp/components/UserTile.dart';
import 'package:chatapp/components/customDrawer.dart';
import 'package:chatapp/pages/chatPage.dart';
import 'package:chatapp/services/auth/auth_services.dart';
import 'package:chatapp/services/chat/chat_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatServices _chatServices = ChatServices();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const CustomDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatServices.getUserStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text("Errors");
        }

        // loading ...

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        // return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    // display all user except current user
    final currentUser = _authService.getCurrentUser();
    if (currentUser != null &&
        userData["email"]?.toLowerCase() != currentUser.email?.toLowerCase()) {
      return UserTile(
        text: userData["email"],
        ontap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverEmail: userData["email"],
                  receiverId: userData["uid"],
                ),
              ));
        },
      );
    } else {
      return Container();
    }
  }
}
