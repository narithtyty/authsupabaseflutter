import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient supabase = Supabase.instance.client;
  // sign in
  Future<AuthResponse> signIn(String email, String password) async {
    return await supabase.auth
        .signInWithPassword(email: email, password: password);
  }

  // sign out
  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  // sign up
  Future<AuthResponse> signUp(String email, String password) async {
    return await supabase.auth.signUp(email: email, password: password);
  }

  // getUser
  String? getUser() {
    return supabase.auth.currentSession?.user.email;
  }
}
