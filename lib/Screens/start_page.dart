import 'package:flutter/material.dart';

class SignedIn extends StatelessWidget {
  final String username;

  const SignedIn({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Welcome, $username!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
