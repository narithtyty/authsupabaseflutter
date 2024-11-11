import 'package:authtutorialsuperbase/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // supabase setup
  await Supabase.initialize(
    url: 'https://shimbuckdpuqhdrbculz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNoaW1idWNrZHB1cWhkcmJjdWx6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzEzMzEzMzksImV4cCI6MjA0NjkwNzMzOX0.C0-GBHs5lZ-hJ86l4tSMZGVYKfu4Mn68rOnUuqi4pWY',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth Tutorial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthGate(),
      debugShowCheckedModeBanner: false,
    );
  }
}
