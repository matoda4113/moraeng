import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreAppInfo {


  FirebaseFirestore firestore =FirebaseFirestore.instance;

  Future<DocumentSnapshot> getOpenContentsInfo(String language)async{
    DocumentSnapshot openContentsInfo =await firestore.collection('OpenContents').doc(language).get();
    return openContentsInfo;
  }


}