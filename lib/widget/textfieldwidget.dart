import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldWidget extends StatefulWidget {

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verifyPasswordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode verifyPasswordFocusNode = FocusNode();

  bool passwordHide=true;



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(



              contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)

              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
              labelText: "이메일",
              labelStyle: TextStyle(
                  color: Colors.grey
              ),

            ),
            cursorColor: Colors.orange,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            focusNode: emailFocusNode,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),

          ),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              suffixIcon: GestureDetector(

                onTap: (){
                  setState(() {
                    passwordHide=!passwordHide;
                  });
                },
                  child: Icon(passwordHide?FontAwesomeIcons.eye:FontAwesomeIcons.eyeSlash,color: Colors.grey,)),



              contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)

              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
              labelText: "비밀번호",
              labelStyle: TextStyle(
                  color: Colors.grey
              ),

            ),
            cursorColor: Colors.orange,
            keyboardType: TextInputType.emailAddress,
            controller: passwordController,
            obscureText: passwordHide,
            focusNode: passwordFocusNode,

          ),
        ],
      ),
    );
  }
}
