import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moraeng/page/landingpage.dart';
import 'package:moraeng/mainpage.dart';
import 'package:moraeng/page/signinpage.dart';
import 'package:moraeng/provider/appinfo.dart';
import 'package:moraeng/provider/postprovider.dart';
import 'package:moraeng/provider/userprovider.dart';
import 'package:moraeng/provider/vocaprovider.dart';
import 'package:moraeng/theme/sarantexttheme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override


  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '모두의랭귀지',
      home: StartPage(),
    );
  }
}


class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  UserProvider userProvider= Get.put(UserProvider());
  PostProvider postProvider= Get.put(PostProvider());
  VocaProvider vocaProvider= Get.put(VocaProvider());
  AppInfoProvider appInfoProvider= Get.put(AppInfoProvider());
  // @override
  // void initState() {
  //   if(userProvider.firebaseAuth.currentUser!=null){
  //     userProvider.getUserDataFromFireStore();
  //   }else{}
  //
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {

    return GetBuilder<UserProvider>(
        builder: (_){
          if(userProvider.firebaseAuth.currentUser!=null) return LandingPage();
          else return Scaffold(
            body: Container(
              child: Center(
                child: AnimatedTextKit(

                  animatedTexts: [
                    WavyAnimatedText(
                      '모두의 랭귀지',
                      textStyle: SaranTextTheme.bigTitle,
                      speed: const Duration(milliseconds: 200),

                    ),

                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                  onFinished: (){
                    Get.offAll(SignInPage());
                  },

                ),
              ),
            ),
          );
        });
  }
}
