import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moraeng/model/usermodelapp.dart';

class FireStoreUserInfo {


  FirebaseFirestore firestore =FirebaseFirestore.instance;

  Future<UserModelApp> getUserInfo(String uid,String email)async{
    try {
      DocumentSnapshot tmpUser =await firestore.collection('Users').doc(uid).get();
      if(tmpUser.exists){
        UserModelApp userFS=UserModelApp.fromFireStore(tmpUser);
        return userFS;
      }else{
        var tmpUser=UserModelApp().toMapUpload(uid,email);
        await firestore.collection('Users').doc(uid).set(tmpUser);

        DocumentSnapshot tmpUser2 =await firestore.collection('Users').doc(uid).get();
        UserModelApp userFS=UserModelApp.fromFireStore(tmpUser2);
        return userFS;

      }
    } on Exception catch (e) {

      print(e);//토스트 사용하기
      return null;
    }


  }


  Future<bool> createUserInfo(String uid,String email)async{
    try {
      QuerySnapshot tmpUser =await firestore.collection('Users').where('email',isEqualTo: email).get();

      if(tmpUser.size==0){
        var tmpUser=UserModelApp().toMapUpload(uid,email);
        await firestore.collection('Users').doc(uid).set(tmpUser);
        return true;
      }else{

        print('이미 같은 이메일을 사용하는 유저 존재함.');
        //이미 같은 이메일을 사용하는 유저 존재함.
        return false;

      }
    } on Exception catch (e) {

      print(e);//토스트 사용하기
      return false;
    }


  }

}