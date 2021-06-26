
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModelApp{

  //유저 개인정보
  String uid;
  String nickName;
  String email;
  String thumbnail;

  Timestamp createAt;
  int point;
  String targetLanguage;
  int userCode; //0-9 관리자, 10-99 관계자, 100~ 유저
  int cash;

  //선호내역
  List keyWord;


  String reference1;
  String reference2;
  String reference3;
  String reference4;
  String reference5;


  UserModelApp(
      {this.uid,
      this.nickName,
      this.email,
      this.thumbnail,
      this.createAt,
      this.point,
      this.targetLanguage,
      this.userCode,
      this.cash,
        this.keyWord,
      this.reference1,
      this.reference2,
      this.reference3,
      this.reference4,
      this.reference5});

  factory UserModelApp.fromFireStore(DocumentSnapshot documentSnapshot){
    Map<String,dynamic>doc =documentSnapshot.data();
    return UserModelApp(

        uid:doc['uid']??"",
      nickName:doc['nickName']??"",
    email:doc['email']??"",
    thumbnail:doc['thumbnail']??"",
        createAt:doc['createAt']??Timestamp(0,0),
    point:doc['point']??0,
    targetLanguage:doc['targetLanguage']??"en",
   userCode:doc['userCode']??100,
   cash:doc['cash']??0,
    keyWord: ['keyWord']??[],
    reference1:doc['reference1']??"",
    reference2:doc['reference2']??"",
    reference3:doc['reference3']??"",
       reference4:doc['reference4']??"",
       reference5:doc['reference5']??"",

    );
  }
  Map<String, dynamic> toMap(UserModelApp data) {
    return {
    'uid':data.uid??"",
    'nickName':data.nickName??"손님",
    'email':data.email??"",
    'thumbnail':data.thumbnail??"",
      'createAt':data.createAt??Timestamp(0,0),
      'point':data.point??0,
      'targetLanguage':data.targetLanguage??"en",
      'userCode':data.userCode??100,
      'cash':data.cash??0,
      'keyword':data.keyWord??[],
      'reference1':data.reference1??"",
      'reference2':data.reference2??"",
      'reference3':data.reference3??"",
      'reference4':data.reference4??"",
      'reference5':data.reference5??"",

    };
  }
  Map<String, dynamic> toMapUpload(String uid,String email) {
    return {
      'uid':uid,
      'nickName':"손님",
      'email':email,
      'thumbnail':"",
      'createAt':Timestamp.now(),
      'point':0,
      'targetLanguage':'en',
      'userCode':100,
      'cash':0,
      'keyword':[],
      'reference1':'',
      'reference2':'',
      'reference3':'',
      'reference4':'',
      'reference5':'',

    };
  }
  Map<String, dynamic> simpleUserInfo(UserModelApp data) {
    return {
      'uid':data.uid??"",
      'nickName':data.nickName??"손님",
      'email':data.email??"",
      'thumbnail':data.thumbnail??"",


    };
  }

}