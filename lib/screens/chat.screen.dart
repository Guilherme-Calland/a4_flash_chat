import 'package:a4_flash_chat/components/flash.chat.button.dart';
import 'package:a4_flash_chat/components/flash.chat.text.field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {

  static const id = 'chat_screen';

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var auth = FirebaseAuth.instance;
  var firestore = Firestore.instance;
  var controller = TextEditingController;
  String message;
  FirebaseUser currentUser;

  @override
  void initState(){
    super.initState();
    getCurrentUser();
  }

  getCurrentUser() async {
    try{
      final user = await auth.currentUser();
      if(user!=null){
        currentUser = user;
      }
    }catch(e){
      print('getting current user: $e' );
    }
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff065600),
        title: Text('chat'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: (){
              auth.signOut();
              Navigator.pop(context);
            }
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            height: 620,
            decoration:
            BoxDecoration( 
              border: Border.all( 
                color: Colors.white
              )
            )
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: FlashAppInputText(
                  color: Color(0xff065600),
                  hint: 'type a message',
                  onChanged: (value){
                    message = value;
                  },
                )
              ),
              FlashChatButton(
                'send',
                Color(0xff065600),
                (){
                  firestore.collection('messages').add(
                    {
                      'text' : message,
                      'sender' : currentUser.email
                    }
                  );
                }
              )
            ],
          )
        ],
      ),
    );
  }
}