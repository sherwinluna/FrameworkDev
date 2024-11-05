import 'package:flutter/material.dart';

import '../routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
  
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Register"),
        TextButton(onPressed: () {
          Navigator.pushNamed(context, Routes.profile);
        }, child: Text('Go to'))
      ],
    );
  }

}