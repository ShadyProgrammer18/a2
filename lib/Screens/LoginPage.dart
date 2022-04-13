import 'package:a2/Screens/RegisterPage.dart';
import 'package:a2/Widgets/AppBtn.dart';
import 'package:a2/Widgets/CustomPass.dart';
import 'package:a2/Widgets/Custombtn.dart';
import 'package:a2/Widgets/CustomEmail.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

   FocusNode _passwordFocusNode;

  @override
    void initState() {
      _passwordFocusNode = FocusNode();
      super.initState();
    }

    @override
      void dispose() {
        _passwordFocusNode.dispose();
        super.dispose();
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView( 
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset("assets/images/cart5.png",width: 90,height: 90,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 190, 0),
                  child: Text("Welcome Back!",
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
                      padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
                      child: Text("Don't have an account?",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        color: Colors.grey, 
                        fontSize: 14
                  ),
                      ),
                    ),
                    AppButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) => RegisterPage()));
                          },
                      text: "Create it!",
                      outlineBtn: true,
                      )
                
                  ],
                ),
                 Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.fromLTRB(0, 40, 235, 0),
                       child: Text("Email Address",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                          ),
                     ),
                     CustomEmail(
                       onSubmitted: (value) {
                        _passwordFocusNode.requestFocus();
                       },
                       textInputAction: TextInputAction.next,
                     ),
                      Padding(
                       padding: const EdgeInsets.fromLTRB(0, 25, 265, 0),
                       child: Text("Password",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[500],
                            fontSize: 13,
                          ),
                          ),
                     ),
                     CustomPassword(
                       focusNode: _passwordFocusNode,
                     ),
                     Padding(
                       padding: const EdgeInsets.fromLTRB(225, 10, 0, 0),
                       child: Text(" Forgot Password",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                          ),
                     ),

                     
                   ],
                 ),
                    CustomBtn(
                      text: "Login",
                      onPressed: (){
                        print("Clicked");
                      },
                      outlineBtn: false,
                    ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
