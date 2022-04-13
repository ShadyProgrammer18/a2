
  

import 'package:a2/Screens/LoginPage.dart';
import 'package:a2/Widgets/AppBtn.dart';
import 'package:a2/Widgets/CustomPass.dart';
import 'package:a2/Widgets/CustomRegBtn.dart';
import 'package:a2/Widgets/CustomEmail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content:  Container(
            child: Text(error),
          ),
          actions: [
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: Text("Close Dialog"))

          ],
        );
      }
      );
  }
 
  Future<String> _createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _registerEmailAddress, password: _registerPassword);
        return null;

    } on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
    return 'The password provided is too weak.';
  } else if (e.code == 'email-already-in-use') {
    return 'The account already exists for that email.';
  }
    return "All spaces must be filled";
    } catch (e) {
       return e.toString();
    }
  }
  
  void _submitForm() async{
    String _createAccountFeedback = await _createAccount(); 
    if(_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback);
    }
  }

  
  String _registerFirstName = "";
  String _registerLastName = ""; 
  String _registerEmailAddress = "";
  String _registerPassword = "";

  FocusNode _passwordFocusNode;
  FocusNode _lastNameFocusNode;
  FocusNode _emailAddressFocusNode;

  @override
    void initState() {
      _passwordFocusNode = FocusNode();
      _lastNameFocusNode = FocusNode();
      _emailAddressFocusNode = FocusNode();
      super.initState();
    }

    @override
      void dispose() {
        _passwordFocusNode.dispose();
        _lastNameFocusNode.dispose();
        _emailAddressFocusNode.dispose();
        super.dispose();
      }
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 200, 0),
                  child: Text("Create Account",
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w700,
                    color: Colors.black, 
                    fontSize: 20
                  ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                      child: Text("Do You already have an account?",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.grey, 
                        fontSize: 13
                  ),
                      ),
                    ),
                    AppButton( 
                      onPressed: (){
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                      } ,
                      outlineBtn: true,
                      text: "Login!",
                      ),
                    SizedBox(width: 4,),
                  
                  ],
                ),
                 Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.fromLTRB(0, 30, 258, 0),
                       child: Text("First Name",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          ),
                     ),
                     CustomEmail(
                       onChanged: (value) {
                         _registerFirstName = value;
                       },
                       onSubmitted: (value) {
                         _lastNameFocusNode.requestFocus();  
                       },
                       textInputAction: TextInputAction.next,
                     ),
                      Padding(
                       padding: const EdgeInsets.fromLTRB(0, 30, 258, 0),
                       child: Text("Last Name",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500],
                            fontSize: 14,
                          ),
                          ),
                     ),
                     CustomEmail(
                       onChanged: (value) {
                         _registerLastName = value;
                       },
                        onSubmitted: (value) {
                          _emailAddressFocusNode.requestFocus();  
                       },
                       focusNode: _lastNameFocusNode,
                       textInputAction: TextInputAction.next,
                     ),
                     Padding(
                       padding: const EdgeInsets.fromLTRB(0, 30, 232, 0),
                       child: Text("Email Address",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500],
                            fontSize: 14,
                          ),
                          ),
                     ),
                     CustomEmail(
                       onChanged:  (value) {
                         _registerEmailAddress = value;
                       },
                       onSubmitted: (value) {
                         _passwordFocusNode.requestFocus();  
                       },
                       focusNode: _emailAddressFocusNode,
                       textInputAction: TextInputAction.next,
                     ),
                     Padding(
                       padding: const EdgeInsets.fromLTRB(0, 25, 262, 0),
                       child: Text("Password",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500],
                            fontSize: 14,
                          ),
                          ),
                     ),
                    CustomPassword(
                      onChanged: (value) {
                         _registerPassword = value;
                       },
                       focusNode: _passwordFocusNode,
                       onSubmitted: (value) {
                         _submitForm();
                       },
                    ),
                       Padding(
                       padding: const EdgeInsets.fromLTRB(0, 19, 0, 0),
                       child: Text("By clicking on the create account button, you are ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                            fontSize: 13,
                          ),
                          ),
                     ),
                     Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.fromLTRB(19, 0, 0, 10),
                           child: Text("agreeing to our",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 13,
                            ),
                            ),
                         ),
                         Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                            child: AppButton(
                              text: "terms and condition",
                              onPressed: (){
                                print("clicked");
                              },
                              outlineBtn: true,
                            ),
                          ),
                       ],
                     ) 
                   ],
                 ),
                    CustomRegBtn(
                      outlineBtn: false,
                      onPressed: (){
                        _submitForm();
                         
                      },
                      text: "Register",
                    ),
              ],
            ),
          ),
        ),
      )
    );
  }
}