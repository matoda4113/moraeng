import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MoraengVocaModel{

  String language;
  String korean;
  String other;
  String url;
  int day;


  MoraengVocaModel({this.language, this.korean, this.other, this.url,this.day});


}

class MoraengVocaModelJson{

  String language;
  List korean;
  List other;
  List url;
  List day;


  MoraengVocaModelJson({this.language, this.korean, this.other, this.url,this.day});

  factory MoraengVocaModelJson.fromJson(Map<String, dynamic> json) {
    return MoraengVocaModelJson(
        korean: json['korean']??[],
        other: json['other']??[],
        language: json['language']??"",
        url: json['url']??[],
        day: json['day']??"");
  }


}