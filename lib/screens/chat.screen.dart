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

bool isMe = false;
FirebaseUser currentUser;

class _ChatState extends State<Chat> {
  var auth = FirebaseAuth.instance;
  var firestore = Firestore.instance;
  var controller = TextEditingController();
  String message;

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
            ),
            child: MessagesStream(firestore: firestore)
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: FlashAppInputText(
                  controller: controller,
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
                  controller.clear();
                  firestore.collection('messages').add(
                    {
                      'text' : message,
                      'sender' : currentUser.email,
                      'date' : DateTime.now()
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

class MessagesStream extends StatelessWidget {
  const MessagesStream({
    Key key,
    @required this.firestore,
  }) : super(key: key);

  final Firestore firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').
      orderBy('date', descending: true).snapshots(),
      builder: (context, snapshot){
        // print(snapshot.data.documents[1]['text']);
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green,
            )
          );
        }
        final messages = snapshot.data.documents;
        List< Text > messageBubbles = [];
        for(var message in messages){
          var text = message.data['text'];
          var sender = message.data['sender'];
          
          var user = null;
          if(currentUser != null){
            user = currentUser.email;
          } else {
            print('nobody here');
          }

          user == sender ? isMe = true : isMe = false;

          var messageBubble = Text(
            '$text',
            style: TextStyle(
              color: isMe ? Color(0xff065600) : Colors.green
            ),
          );
          
          messageBubbles.add(messageBubble);

        }
        return Expanded(
            child: ListView(
            reverse: true,
            children: messageBubbles,
          ),
        );
      }
    );
  }
}