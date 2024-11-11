import 'package:flutter/material.dart';
import '../auth/auth_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final authService = AuthService();

  // signOut
  void signOut() async {
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = authService.getUser();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              signOut();
            },
          )
        ],
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
            'User  ID: ${user ?? "Not logged in"}'), // Handle null user case
      ),
    );
  }
}
