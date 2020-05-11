import 'package:a4_flash_chat/screens/chat.screen.dart';
import 'package:a4_flash_chat/screens/login.screen.dart';
import 'package:a4_flash_chat/screens/registration.screen.dart';
import 'package:a4_flash_chat/screens/welcome.screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: FlashApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class FlashApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Chat.id,
      routes: {
        Welcome.id: (context) => Welcome(),
        Registration.id: (context) => Registration(),
        Login.id: (context) => Login(),
        Chat.id: (context) => Chat(),
      },
    );
  }
}