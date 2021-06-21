import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:moraeng/card/moraengpostcard.dart';
import 'package:moraeng/card/moraengvocacard.dart';
import 'package:moraeng/model/moraengvocamodel.dart';
import 'package:moraeng/model/postmodelapp.dart';
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
  var postProvider = Get.put(PostProvider());
  var vocaProvider = Get.put(VocaProvider());
  UserProvider userProvider = Get.find();


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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        _.userFS.nickName,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(' 님을 위한 추천 컨텐츠'),
                                    ],
                                  ),
                                  Text("더보기.."),
                                ],
                              ),
                            ),
                            CarouselSlider.builder(
                                itemCount:
                                    postProvider.recommendedPost.docs.length,
                                itemBuilder: (context, index1, index2) {
                                  return MoraengPostCard(
                                    thisPost: PostModelApp.fromFireStore(
                                        postProvider
                                            .recommendedPost.docs[index1]),
                                  );
                                },
                                options: CarouselOptions(
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 5),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 1000),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  // onPageChanged: callbackFunction,
                                  scrollDirection: Axis.horizontal,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
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
                                        '인기 컨텐츠',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Text("더보기.."),
                                ],
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 3/1,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(width: 15,),
                                    Row(
                                        children: postProvider.recommendedPost.docs.map((DocumentSnapshot doc) {
                                          return Row(
                                            children: [
                                              MoraengPostCard(

                                                thisPost: PostModelApp.fromFireStore(
                                                    doc),
                                              ),
                                              SizedBox(width: 10,)
                                            ],
                                          );
                                        }).toList()
                                    ),
                                  ],
                                ),
                              ),
                            )


                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
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
                                        '동화로 배우기',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Text("더보기.."),
                                ],
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 4/1,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(width: 15,),
                                    Row(
                                      children: postProvider.recommendedPost.docs.map((DocumentSnapshot doc) {
                                        return Row(
                                          children: [
                                            MoraengPostCard(
                                              ratio: 1,
                                              thisPost: PostModelApp.fromFireStore(
                                                  doc),
                                            ),
                                            SizedBox(width: 10,)
                                          ],
                                        );
                                      }).toList()
                                    ),
                                  ],
                                ),
                              ),
                            )


                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
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
                                        '노래로 배우기',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Text("더보기.."),
                                ],
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 2/1,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(width: 15,),
                                    Row(
                                        children: postProvider.recommendedPost.docs.map((DocumentSnapshot doc) {
                                          return Row(
                                            children: [
                                              MoraengPostCard(
                                                ratio: 1,
                                                isCircle: true,
                                                thisPost: PostModelApp.fromFireStore(
                                                    doc),
                                              ),
                                              SizedBox(width: 10,)
                                            ],
                                          );
                                        }).toList()
                                    ),
                                  ],
                                ),
                              ),
                            )


                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
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
                                        '드라마로 배우기',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Text("더보기.."),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: AspectRatio(
                                aspectRatio: 1/1.2,
                                child: GridView.count(
                                    crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,

                                  children: postProvider.recommendedPost.docs.map((DocumentSnapshot doc){
                                    return MoraengPostCard(
                                      ratio: 1,
                                      thisPost: PostModelApp.fromFireStore(
                                          doc),
                                    );
                                  }).toList()
                                )
                              ),
                            ),
                            SizedBox(height: 50,)


                          ],
                        ),
                      ),


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
