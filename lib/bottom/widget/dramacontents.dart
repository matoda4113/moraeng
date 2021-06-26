import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moraeng/card/moraengpostcard.dart';
import 'package:moraeng/model/postmodelapp.dart';
import 'package:moraeng/provider/postprovider.dart';

class DramaContents extends StatelessWidget {
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
