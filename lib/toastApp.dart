import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastApp{


  static void checkYourInput(){
    Fluttertoast.showToast(
        msg: '입력사항을 모두 올바르게 입력해 해주세요.',
      backgroundColor: Colors.red

    );

  }
  static void checkYourPassword(){
    Fluttertoast.showToast(
        msg: '비밀번호가 서로 다릅니다.',
        backgroundColor: Colors.red

    );

  }
  static void otherToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: Colors.red

    );

  }
  static void helloUser(String email){
    Fluttertoast.showToast(
        msg: '$email 님 안녕하세요.',
        backgroundColor: Colors.orange

    );

  }
  static void successCreateData(String email){
    Fluttertoast.showToast(
        msg: '$email 님 회원가입 되었습니다. 새로 로그인 해주세요.',
        backgroundColor: Colors.orange,
      timeInSecForIosWeb: 2

    );

  }
}