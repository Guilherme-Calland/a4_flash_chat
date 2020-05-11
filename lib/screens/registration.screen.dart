import 'package:a4_flash_chat/components/flash.chat.button.dart';
import 'package:a4_flash_chat/components/flash.chat.text.field.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {

  static const id = 'registration_screen';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
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
              'register',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            FlashAppInputText(
              color: Colors.blue,
              onChanged: (value){
                email = value;  
              },
              hint: 'enter your email'
            ),
            FlashAppInputText(
              color: Colors.red,
              onChanged: (value){
                password = value;
              },
              hint: 'enter your password'
            ),
            FlashChatButton(
              'register', Colors.purple, (){
                //register
              }
            )
          ],
        )
      )
    );
  }
}

