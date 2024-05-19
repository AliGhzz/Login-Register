import 'package:flutter/material.dart';
import 'Screens/login.dart';
import 'Screens/register.dart';
import 'Screens/password_recovery.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/recovery_password':(context) => PasswordRecovery(),
      },
    );
  }
}





