import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:moraeng/model/usermodelapp.dart';
import 'package:moraeng/service/firebasepost.dart';
import 'package:moraeng/service/firestoreappinfo.dart';
import 'package:moraeng/service/firestoreuserinfo.dart';
import 'package:moraeng/toastApp.dart';

class AppInfoProvider extends GetxController {

  FireStoreAppInfo fireStoreAppInfo = FireStoreAppInfo();

  Map<String,dynamic> openContentsInfo;


  Future<bool> getOpenContentsInfo(String language)async{
    DocumentSnapshot data = await fireStoreAppInfo.getOpenContentsInfo(language);
    if(data!=null){
      openContentsInfo=data.data();
      update();
      return true;
    }else{
      return false;
    }

  }




}
