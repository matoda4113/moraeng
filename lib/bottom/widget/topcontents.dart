import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moraeng/card/moraengpostcard.dart';
import 'package:moraeng/model/postmodelapp.dart';
import 'package:moraeng/provider/postprovider.dart';
import 'package:moraeng/provider/userprovider.dart';

class TopContents extends StatelessWidget {

  PostProvider postProvider = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostProvider>(builder: (_){
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
          ],
        ),
      );
    });
  }
}
