import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moraeng/card/moraengpostcard.dart';
import 'package:moraeng/model/postmodelapp.dart';
import 'package:moraeng/provider/appinfo.dart';
import 'package:moraeng/provider/postprovider.dart';
import 'package:moraeng/provider/userprovider.dart';

class RecomendContents extends StatefulWidget {
  @override
  _RecomendContentsState createState() => _RecomendContentsState();
}

class _RecomendContentsState extends State<RecomendContents> {
  UserProvider userProvider = Get.find();
  PostProvider postProvider = Get.find();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProvider>(
        builder: (_){
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
              ],
            ),
          );
        }
    );
  }
}

