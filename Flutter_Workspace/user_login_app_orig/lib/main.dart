import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(UserLoginApp());
}

class UserLoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
