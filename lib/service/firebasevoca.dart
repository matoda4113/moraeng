import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseVoca {


  FirebaseFirestore firestore =FirebaseFirestore.instance;

  Future<DocumentSnapshot> getVocaList(String country)async{
    DocumentSnapshot vocaList =await firestore.collection('Voca').doc(country).get();

    return vocaList;
  }




}