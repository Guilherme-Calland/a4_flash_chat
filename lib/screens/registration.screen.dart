import 'package:flutter/material.dart';

class Registration extends StatefulWidget {

  static const id = 'registration_screen';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Registration Screen',
          style: TextStyle(
            color: Colors.white
          ),
        )
      )
    );
  }
}