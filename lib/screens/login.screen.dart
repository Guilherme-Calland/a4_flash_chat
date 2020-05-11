import 'package:a4_flash_chat/components/flash.chat.button.dart';
import 'package:a4_flash_chat/components/flash.chat.text.field.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  static const id = 'login_screen';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'login',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            FlashAppInputText(
              color: Colors.green,
              onChanged: (value){
                email = value;  
              },
              hint: 'enter your email'
            ),
            FlashAppInputText(
              color: Colors.brown,
              onChanged: (value){
                password = value;
              },
              hint: 'enter your password'
            ),
            FlashChatButton(
              'log in', Colors.pink, (){
                //register
              }
            )
          ],
        )
      )
    );
  }
}