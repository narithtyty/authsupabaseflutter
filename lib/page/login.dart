import 'package:authtutorialsuperbase/page/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/auth_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // get authService => null;
  final authService = AuthService();

  // form controller

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // loading
  bool _isLoading = false;
  // signIn

  void login() async {
    setState(() {
      _isLoading = true;
    });
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    try {
      await authService.signIn(email, password);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
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
        ElevatedButton(
          onPressed: login,
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.black38,
                  ),
                )
              : const Text('Login'),
        ),
        // signUp
        const SizedBox(height: 10),

        Center(
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const Register(),
                      ));
                },
                child: const Text('Don\'t have an account? Sign Up'))),
      ]),
    );
  }
}
