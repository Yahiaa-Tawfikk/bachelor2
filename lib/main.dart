import 'package:flutter/material.dart';
import 'package:bachelor2/Screens/authentication/presentation/pages/sign_up.dart';
import 'Screens/client_page.dart';
import 'Screens/pedastrian_page.dart';
import 'Screens/user_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './service_locator.dart';

void main() async {
  // Ensure Firebase is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyBachelorApp());
}

class MyBachelorApp extends StatelessWidget {
  const MyBachelorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my_bachelor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Welcome to CdrivesApp'),
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('lib/assets/Cdrives.jpg', height: 100.0),
            const SizedBox(height: 20.0),
            const Text(
              'CdriversApp',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Your reliable companion for managing and accessing Traffic Systems.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 15.0),
                textStyle: const TextStyle(fontSize: 18.0),
              ),
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my_bachelor Home'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Login as',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10.0),
            _customButton(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserLoginPage()));
            }, 'Login as User'),
            const SizedBox(
              height: 10.0,
            ),
            _customButton(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ClientLoginPage()));
            }, 'Login as Client'),
            const SizedBox(
              height: 10.0,
            ),
            _customButton(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PedestrianLoginPage()));
            }, 'Login as Pedestrian')
          ],
        ),
      ),
    );
  }
}

Widget _customButton(onPressed, text) {
  return (ElevatedButton(
    
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      fixedSize: Size(250,50),
      backgroundColor: Colors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
      textStyle: const TextStyle(fontSize: 18.0),
    ),
    child: Text(text),
  ));
}
