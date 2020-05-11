import 'package:a4_flash_chat/components/flash.chat.button.dart';
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
      body: 
        Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('flash app', style: TextStyle(
              color: Colors.white
            ),),
            FlashChatButton(
              'register', Color(0xff065600), (){
                Navigator.pushNamed(context, 'registration_screen');
              }
            ),
            FlashChatButton(
              'login', Color(0xff002451), (){
                Navigator.pushNamed(context, 'login_screen');
              }
            ),
          ],
      ),
        )
    );
  }
}

