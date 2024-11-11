import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../page/login.dart';
import '../page/profile.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.blue,
          ));
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        // check if have valid session
        final session = snapshot.hasData ? snapshot.data?.session : null;
        if (session != null) {
          return const Profile();
        }
        return const Login();
      },
    );
  }
}
