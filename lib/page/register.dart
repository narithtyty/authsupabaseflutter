import 'package:authtutorialsuperbase/page/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/auth_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // auth service
  final authService = AuthService();

  // form controller

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign up
  signUp() async {
    // check if password match
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password do not match')),
      );
      return; // stop function
    }

    try {
      await authService.signUp(
          emailController.text.trim(), passwordController.text.trim());
      // redirect to profile
      Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => const Profile(),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: confirmPasswordController,
          decoration: const InputDecoration(labelText: 'Confirm Password'),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        ElevatedButton(onPressed: signUp, child: const Text('Sign Up')),
        // signUp
        const SizedBox(height: 10),

        Center(
            child: GestureDetector(
                onTap: () {},
                child: const Text('Don\'t have an account? Sign Up'))),
      ]),
    );
  }
}
