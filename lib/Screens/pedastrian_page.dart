import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bachelor2/main.dart';
import 'package:bachelor2/Screens/start_page.dart';
import 'package:bachelor2/Screens/client_page.dart';

class PedestrianLoginPage extends StatefulWidget {
  const PedestrianLoginPage({super.key});

  @override
  _PedestrianLoginPageState createState() => _PedestrianLoginPageState();
}

class _PedestrianLoginPageState extends State<PedestrianLoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // State variable for error messages
  String errorMessage = '';

  // Login function for the pedestrian
  Future<void> _login() async {
    final String username = usernameController.text;
    final String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = 'Please fill in both fields';
      });
      return;
    }

    try {
      // Attempt to sign in with email and password (Firebase Authentication)
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      // If successful, navigate to another screen (e.g., Pedestrian's Home page)
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ClientLoginPage()), // Navigate to your home/start page
      );
    } catch (e) {
      setState(() {
        errorMessage = 'Login failed: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedestrian Login'),
        backgroundColor: Colors.orange, // Pedestrian Login color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Username TextField (Email input)
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username (Email)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Password TextField
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Error message display
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              const SizedBox(height: 16),
              // Login Button
              ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
