import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moraeng/mainpage.dart';
import 'package:moraeng/provider/appinfo.dart';
import 'package:moraeng/provider/postprovider.dart';
import 'package:moraeng/provider/userprovider.dart';
import 'package:moraeng/provider/vocaprovider.dart';
import 'package:moraeng/theme/sarantexttheme.dart';

class LandingPage extends StatefulWidget {

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {



  void init()async{
    PostProvider postProvider= Get.find();
    VocaProvider vocaProvider= Get.find();
    UserProvider userProvider= Get.find();
    AppInfoProvider appInfoProvider= Get.find();


    await postProvider.getRecommendedPost();
    await userProvider.getUserDataFromFireStore();

    await appInfoProvider.getOpenContentsInfo(userProvider.userFS.targetLanguage);
    await vocaProvider.getVocaList(userProvider.userFS.targetLanguage);


    Timer(Duration(seconds: 1), (){
      Get.offAll(() => MainPage());
    } );
  }

  @override
  void initState() {
    init();

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

            ),
        ),
      ),
    );
  }
}
