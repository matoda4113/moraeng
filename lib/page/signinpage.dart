import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:moraeng/page/landingpage.dart';
import 'package:moraeng/page/signuppgae.dart';
import 'package:moraeng/provider/userprovider.dart';
import 'package:moraeng/start.dart';
import 'package:moraeng/theme/sarantexttheme.dart';
import 'package:moraeng/toastApp.dart';
import 'package:moraeng/widget/longbutton.dart';
import 'package:moraeng/widget/snslogoinwidget.dart';
import 'package:moraeng/widget/textfieldwidget.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verifyPasswordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode verifyPasswordFocusNode = FocusNode();

  bool passwordHide=true;


  UserProvider userProvider= Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProvider>(
      builder: (_){
        return Scaffold(

            body: Stack(
              children: [

                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,

                    padding: const EdgeInsets.symmetric(horizontal: 15),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,


                      children: [
                        Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            MediaQuery.of(context).size.width>=320&&MediaQuery.of(context).size.height>=480
                                ?GestureDetector(
                              onTap: (){


                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                  Text('안녕하세요,',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),),
                                  SizedBox(height: 10,),
                                  Text('모두의 랭귀지 입니다.',style: SaranTextTheme.bigTitle,),




                                ],
                              ),
                            ):SizedBox(),
                            SizedBox(height: MediaQuery.of(context).size.height*0.1,),


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
                                  keyboardType: TextInputType.emailAddress,
                                  controller: passwordController,
                                  obscureText: passwordHide,
                                  focusNode: passwordFocusNode,

                                ),
                                SizedBox(height: 20,),
                                LongButton(
                                  name: "이메일 로그인",
                                  color: Colors.orange,
                                  widgetFunction: ()async{

                                    if(emailController.text.isNotEmpty&&passwordController.text.isNotEmpty){


                                        userProvider.statusLoadingTrue();
                                        bool login=await userProvider.signInWithEmail(emailController.text, passwordController.text);
                                        if(login){
                                          Get.offAll(LandingPage());
                                        }
                                        userProvider.statusLoadingFalse();

                                    }else{


                                      ToastApp.checkYourInput();
                                    }




                                  },
                                ),
                                SizedBox(height: 20,),
                                SNSAuthWidget(0),
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.1,),



                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text("새로오셨나요?"),
                            SizedBox(width: 5,),
                            GestureDetector(
                                onTap: (){
                                  Get.to(SignUpPage());
                                },
                                child: Text("회원가입 하러가기",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange),)),
                          ],
                        ),
                        SizedBox(height: 50,)
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
