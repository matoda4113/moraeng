import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:moraeng/page/landingpage.dart';
import 'package:moraeng/page/signinpage.dart';
import 'package:moraeng/provider/userprovider.dart';
import 'package:moraeng/start.dart';
import 'package:moraeng/theme/sarantexttheme.dart';
import 'package:moraeng/toastApp.dart';
import 'package:moraeng/widget/longbutton.dart';
import 'package:moraeng/widget/snslogoinwidget.dart';
import 'package:moraeng/widget/textfieldwidget.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verifyPasswordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode verifyPasswordFocusNode = FocusNode();

  bool passwordHide=true;
  bool passwordHide2=true;

  UserProvider userProvider= Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProvider>(
      builder: (_){
        return Scaffold(

          appBar: AppBar(title: Text("간편 이메일 가입"),backgroundColor: Colors.orange,),
            body: Stack(
              children: [

                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 15),
                    child: Column(


                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [



                        Column(
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

                              controller: passwordController,
                              obscureText: passwordHide,
                              focusNode: passwordFocusNode,
                              onEditingComplete: () => FocusScope.of(context).nextFocus(),
                            ),
                            SizedBox(height: 20,),
                            TextField(
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(

                                    onTap: (){
                                      setState(() {
                                        passwordHide2=!passwordHide2;
                                      });
                                    },
                                    child: Icon(passwordHide2?FontAwesomeIcons.eye:FontAwesomeIcons.eyeSlash,color: Colors.grey,)),



                                contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)

                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                labelText: "비밀번호 확인",
                                labelStyle: TextStyle(
                                    color: Colors.grey
                                ),

                              ),
                              cursorColor: Colors.orange,
                              controller: verifyPasswordController,
                              obscureText: passwordHide2,
                              focusNode: verifyPasswordFocusNode,

                            ),
                            SizedBox(height: 20,),
                            LongButton(
                              name: "이메일 회원가입",
                              color: Colors.orange,
                              widgetFunction: ()async{

                                if(emailController.text.isNotEmpty&&passwordController.text.isNotEmpty&&verifyPasswordController.text.isNotEmpty){

                                  if(passwordController.text==verifyPasswordController.text){
                                    userProvider.statusLoadingTrue();
                                    bool login=await userProvider.signUpWithEmail(emailController.text, passwordController.text);
                                    if(login){

                                      Get.offAll(StartPage());
                                    }
                                    userProvider.statusLoadingFalse();
                                  }else{ToastApp.checkYourPassword();}
                                }else{


                                ToastApp.checkYourInput();
                                }


                              },
                            ),
                            SizedBox(height: 20,),
                            SNSAuthWidget(1),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: userProvider.userLoading,
                  child: Container(
                    color: Colors.white.withOpacity(0.5),

                    child: Center(child: CircularProgressIndicator()),
                  ),
                )
              ],
            )

        );
      },

    );
  }

}
