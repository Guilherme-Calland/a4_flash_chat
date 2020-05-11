import 'package:flutter/material.dart';

class FlashAppInputText extends StatelessWidget {

  Color color;
  Function onChanged;
  String hint;

  FlashAppInputText({this.color, this.onChanged, this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.all(10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.white
        ),
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white
          )
        ),
      )
    );
  }
}