import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moraeng/card/moraengvocacard.dart';
import 'package:moraeng/provider/appinfo.dart';
import 'package:moraeng/provider/vocaprovider.dart';

class TodayVoca extends StatefulWidget {
  @override
  _TodayVocaState createState() => _TodayVocaState();
}

class _TodayVocaState extends State<TodayVoca> {

  VocaProvider vocaProvider = Get.find();
  AppInfoProvider appinfoProvider = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VocaProvider>(
        builder:(_){
      return Container(
        child: Column(
          children: [
            Container(

              child: Column(

                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '오늘의 단어',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Text("더보기.."),
                      ],
                    ),
                  ),

                  Container(
                    height: 100,
                    child: ListView.builder(

                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: vocaProvider.todayVocaList.length,
                        itemBuilder: (BuildContext context,int index){

                          return Row(
                            children: [
                              SizedBox(width: 15,),

                              MoraengVocaCard(
                                oneVoca: vocaProvider.todayVocaList[index],

                              ),
                            ],
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      );
    });
  }
}


