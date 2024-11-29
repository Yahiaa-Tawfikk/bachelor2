import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // TextControllers for capturing user input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Checkboxes for role selection
  bool _isClient = false;
  bool _isUser = false;
  bool _isPedestrian = false;

  // Firebase Authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign-up function
  Future<void> _signUp() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    print('Name: $name, Email: $email, Password: $password');

    String selectedRole = '';
    if (_isClient) {
      selectedRole = 'Client';
    } else if (_isUser) {
      selectedRole = 'User';
    } else if (_isPedestrian) {
      selectedRole = 'Pedestrian';
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.sendEmailVerification();

      print('Name2222: $name, Email2222: $email, Password2222: $password');

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Sign Up Successful'),
            content: Text('A verification email has been sent to $email.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to sign up: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Checkbox(
                  value: _isClient,
                  onChanged: (bool? value) {
                    setState(() {
                      _isClient = value!;
                      if (_isClient) {
                        _isUser = false;
                        _isPedestrian = false;
                      }
                    });
                  },
                ),
                const Text('Client'),
                Checkbox(
                  value: _isUser,
                  onChanged: (bool? value) {
                    setState(() {
                      _isUser = value!;
                      if (_isUser) {
                        _isClient = false;
                        _isPedestrian = false;
                      }
                    });
                  },
                ),
                const Text('User'),
                Checkbox(
                  value: _isPedestrian,
                  onChanged: (bool? value) {
                    setState(() {
                      _isPedestrian = value!;
                      if (_isPedestrian) {
                        _isClient = false;
                        _isUser = false;
                      }
                    });
                  },
                ),
                const Text('Pedestrian'),
              ],
            ),
            const SizedBox(height: 16),
            // Sign-up button
            ElevatedButton(
              onPressed: _signUp,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignUpPage(),
  ));
}
