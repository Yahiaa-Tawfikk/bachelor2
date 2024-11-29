import 'package:flutter/material.dart';

class ClientLoginPage extends StatelessWidget {
  const ClientLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Login'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'Client Login Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
