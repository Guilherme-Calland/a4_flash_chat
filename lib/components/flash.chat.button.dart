import 'package:flutter/material.dart';

class FlashChatButton extends StatelessWidget {
  String title;
  Color color;
  Function onPressed;

  FlashChatButton(this.title, this.color, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        padding: EdgeInsets.all(10),
        color: color,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white
          ),
        ),
        onPressed: onPressed
      )
    );
  }
}