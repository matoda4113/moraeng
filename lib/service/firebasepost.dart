import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebasePost {


  FirebaseFirestore firestore =FirebaseFirestore.instance;

  Future<QuerySnapshot> getRecommendedPost()async{
    QuerySnapshot recommendedPost =await firestore.collection('Posts').limit(5).get();
    return recommendedPost;
}




}