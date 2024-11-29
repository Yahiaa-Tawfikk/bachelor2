import 'package:flutter/material.dart';
import 'package:bachelor2/Screens/authentication/presentation/Controller/auth_cont.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var role = '';
  // Checkboxes for role selection
  bool _isClient = false;
  bool _isUser = false;
  bool _isPedestrian = false;

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
                      role = 'client';

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
                      role = 'user';

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
                      role = 'pedestrian';

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
              onPressed: () => AuthController.SignUp(
                  context,
                  _emailController.text,
                  _nameController.text,
                  _passwordController.text,
                  role),
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
