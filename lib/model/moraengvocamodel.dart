import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MoraengVocaModel{

  String country;
  String korean;
  String other;
  String url;
  int day;


  MoraengVocaModel({this.country, this.korean, this.other, this.url,this.day});


}

class MoraengVocaModelJson{

  String country;
  List korean;
  List other;
  List url;
  List day;


  MoraengVocaModelJson({this.country, this.korean, this.other, this.url,this.day});

  factory MoraengVocaModelJson.fromJson(Map<String, dynamic> json) {
    return MoraengVocaModelJson(
        korean: json['korean']??[],
        other: json['other']??[],
        country: json['country']??[],
        url: json['url']??[],
        day: json['day']??"");
  }


}