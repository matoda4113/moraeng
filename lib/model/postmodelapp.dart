import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostModelApp{

  //고유정보
  String id;
  String title;
  String thumbnail;
  int typeCode; //0=동화 1=노래
  String videoUrl; //영상주소



  //변화정보
  int totalView; //전체 클릭수
  int weeklyView; //한주의 클릭수

  PostModelApp({
    this.id,
    this.title,
    this.thumbnail,
    this.typeCode,
    this.videoUrl,

    this.totalView,
    this.weeklyView,
  });

  factory PostModelApp.fromFireStore(DocumentSnapshot documentSnapshot){
    Map<String,dynamic>doc =documentSnapshot.data();
    return PostModelApp(
      id: doc['id']??"",
      title: doc['title']??"",
      thumbnail: doc['thumbnail']??"",
      typeCode: doc['typeCode']??1000,


      totalView: doc['totalView']??0,
      weeklyView: doc['weeklyView']??0,
    );
  }

}