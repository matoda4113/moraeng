import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:moraeng/bottom/widget/dramacontents.dart';
import 'package:moraeng/bottom/widget/fairytalecontents.dart';
import 'package:moraeng/bottom/widget/recomendcontents.dart';
import 'package:moraeng/bottom/widget/songcontents.dart';
import 'package:moraeng/bottom/widget/todayvoca.dart';
import 'package:moraeng/bottom/widget/topcontents.dart';
import 'package:moraeng/card/moraengpostcard.dart';
import 'package:moraeng/card/moraengvocacard.dart';
import 'package:moraeng/model/moraengvocamodel.dart';
import 'package:moraeng/model/postmodelapp.dart';
import 'package:moraeng/provider/appinfo.dart';
import 'package:moraeng/provider/postprovider.dart';
import 'package:moraeng/provider/userprovider.dart';
import 'package:moraeng/provider/vocaprovider.dart';
import 'package:moraeng/theme/sarantexttheme.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  UserProvider userProvider = Get.find();
  PostProvider postProvider = Get.find();
  VocaProvider vocaProvider = Get.find();
  AppInfoProvider appinfoProvider = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GetBuilder<UserProvider>(
      builder: (_) {
        return Container(
          child: Column(
            children: [

              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){

                      },
                      child: Text(
                        '모두의 랭귀지',
                        style: SaranTextTheme.bigTitle,
                      ),
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5000),
                            color: Colors.orange),
                        child: Text(
                          '모두 포인트 ${userProvider.userFS.point} point',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RecomendContents(),
                      appinfoProvider.openContentsInfo['voca']!=null?appinfoProvider.openContentsInfo['voca']?TodayVoca():SizedBox():SizedBox(),
                      appinfoProvider.openContentsInfo['top']!=null?appinfoProvider.openContentsInfo['top']?TopContents():SizedBox():SizedBox(),
                      appinfoProvider.openContentsInfo['fairytale']!=null?appinfoProvider.openContentsInfo['fairytale']?FairytaleContents():SizedBox():SizedBox(),
                      appinfoProvider.openContentsInfo['song']!=null?appinfoProvider.openContentsInfo['song']?SongContents():SizedBox():SizedBox(),
                      appinfoProvider.openContentsInfo['drama']!=null?appinfoProvider.openContentsInfo['drama']?DramaContents():SizedBox():SizedBox(),





                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }


}
