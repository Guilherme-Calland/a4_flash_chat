import 'package:flutter/material.dart';

class FlashAppInputText extends StatelessWidget {

  Color color;
  Function onChanged;
  String hint;
  TextEditingController controller;

  FlashAppInputText({this.color, this.onChanged, this.hint, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
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