import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {

  static const id = 'welcome_screen';

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Welcome Screen',
          style: TextStyle(
            color: Colors.white
          ),
        )
      )
    );
  }
}