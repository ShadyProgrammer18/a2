
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool outlineBtn;
  CustomBtn({this.text, this.onPressed, this.outlineBtn});

  @override
  Widget build(BuildContext context) {
    bool _outlineBtn = outlineBtn ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _outlineBtn ? Colors.transparent : Colors.orange.withOpacity(.5),
          border: Border.all(
            color: Colors.orange.withOpacity(.5),
            width: 0.0
          ),
          borderRadius: BorderRadius.circular(5)
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 50.0
        ),
        child: Text(
          text ?? "Text",
        style: TextStyle(
          fontFamily: "Lato",
          fontWeight: FontWeight.w700,
          color: _outlineBtn ? Colors.black : Colors.white, 
          fontSize: 18
          ),
        ),
      ),
    );
  }
}