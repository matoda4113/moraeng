import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostModelApp{

  //고유정보
  String id;
  String title;
  String thumbnail;
  String language;
  List keyword;
  int typeCode; //0=동화 1=노래
  String videoUrl; //영상주소



  //변화정보
  int totalView; //전체 클릭수
  int weeklyView; //한주의 클릭수

  PostModelApp({
    this.id,
    this.title,
    this.thumbnail,
    this.language,
    this.keyword,
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
      language: doc['language']??"",
      keyword: doc['keyword']??[],
      typeCode: doc['typeCode']??1000,
      videoUrl: doc['videoUrl']??"",


      totalView: doc['totalView']??0,
      weeklyView: doc['weeklyView']??0,
    );
  }

}