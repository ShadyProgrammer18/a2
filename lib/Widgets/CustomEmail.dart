
import 'package:flutter/material.dart';

class CustomEmail extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  CustomEmail({this.hintText, this.onChanged,this.onSubmitted, this.focusNode, this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
         horizontal: 15.0,
      ),
      decoration: BoxDecoration(
           color: Color(0xFFF2F2F2),   
           ),
      child: TextField(
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.orange[500],
        cursorHeight: 26,
        cursorWidth: 2.4,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.black,
           fontFamily: "Poppins",
          fontWeight: FontWeight.w500, 
          fontSize: 20
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 17.0
          ),

        ),
      ),
    );
  }
}