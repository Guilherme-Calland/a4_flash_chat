import 'package:flutter/material.dart';

class Chat extends StatefulWidget {

  static const id = 'chat_screen';

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Chat Screen',
          style: TextStyle(
            color: Colors.white
          ),
        )
      )
    );
  }
}