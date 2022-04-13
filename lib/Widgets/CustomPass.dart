
import 'package:flutter/material.dart';

class CustomPassword extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  CustomPassword({this.hintText, this.onChanged,this.onSubmitted, this.focusNode,});
  @override
  _CustomPasswordState createState() => _CustomPasswordState();
}

class _CustomPasswordState extends State<CustomPassword> {
  TextEditingController _controller = TextEditingController();
  bool obscureText = true;
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
        keyboardType: TextInputType.text,
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        autofocus: false,
        controller: _controller,
        obscureText: obscureText,
        cursorColor: Colors.orange[500],
        cursorHeight: 26,
        cursorWidth: 2.4,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(obscureText ? Icons.visibility_off 
             : Icons.visibility, color: Colors.orange,), 
            onPressed: () {
              obscureText = !obscureText;
              setState(() {
                              
                            });
            }),
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