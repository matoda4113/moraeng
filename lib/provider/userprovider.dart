import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:moraeng/model/usermodelapp.dart';
import 'package:moraeng/service/firebasepost.dart';
import 'package:moraeng/service/firestoreuserinfo.dart';
import 'package:moraeng/toastApp.dart';

class UserProvider extends GetxController {
  FireStoreUserInfo fireStoreUserInfo = FireStoreUserInfo();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance; // Firebase 인증 플러그인의 인스턴스

  UserModelApp userFS; // Firestore 사용자 데이터


  bool userLoading=false;

  int testInt=1;

  void plusInt(){
    testInt++;
    update();
  }






  // 이메일/비밀번호로 Firebase에 회원가입
  Future<bool> signUpWithEmail(String email, String password) async {

    try {

      UserCredential result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        // 인증 메일 발송
        result.user.sendEmailVerification();



        //유저데이터 firestore 생성 여부
        bool createUserdata=await fireStoreUserInfo.createUserInfo(result.user.uid, email);
        if(createUserdata){
          //성공시 정상진행
          signOut();
          ToastApp.successCreateData(email);
          return true;
        }else{
          //실패시 등록했던 Auth까지 삭제
          await result.user.delete();
          return false;
        }

      }
    } on FirebaseAuthException catch (e) {

      switch(e.code){
        case "email-already-in-use":
          ToastApp.otherToast("이미 사용중인 이메일 입니다.");
          break;
        case "invalid-email":
          ToastApp.otherToast("잘못된 이메일 형식입니다.");
          break;
        case "operation-not-allowed":
          ToastApp.otherToast("사용할 수 없는 방식입니다.");
          break;
        case "weak-password":
          ToastApp.otherToast("비밀번호 보안 수준이 너무 낮습니다.");
          break;
        default:
          ToastApp.otherToast("알수없는 오류가 발생했습니다.");
      }
      return false;
    }
  }




  // 이메일/비밀번호로 Firebase에 로그인
  Future<bool> signInWithEmail(String email, String password) async {

    try {
      UserCredential result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result != null) {
        await getUserDataFromFireStore();
        ToastApp.helloUser(email);
        return true;

      }
      return false;
    } on FirebaseAuthException catch (e) {

      switch(e.code){
        case "invalid-email":
          ToastApp.otherToast("잘못된 이메일 형식입니다.");
          break;
        case "user-disabled":
          ToastApp.otherToast("이미 탈퇴한 사용자 입니다.");
          break;
        case "user-not-found":
          ToastApp.otherToast("사용자를 찾을 수 없습니다.");
          break;
        case "wrong-password":
          ToastApp.otherToast("잘못된 비밀번호 입니다.");
          break;
        default:
          ToastApp.otherToast("알수없는 오류가 발생했습니다.");
      }
      return false;
    }
  }

  // Firebase로부터 로그아웃
  signOut() async {
    await firebaseAuth.signOut();
    userFS=null;
    update();
  }


  // 사용자에게 비밀번호 재설정 메일을 한글로 전송 시도
  sendPasswordResetEmailByKorean() async {
    await firebaseAuth.setLanguageCode("ko");
    sendPasswordResetEmail();
  }

  // 사용자에게 비밀번호 재설정 메일을 전송
  sendPasswordResetEmail() async {
    firebaseAuth.sendPasswordResetEmail(email: firebaseAuth.currentUser.email);
  }

  // Firebase로부터 회원 탈퇴
  withdrawalAccount() async {
    await firebaseAuth.currentUser.delete();
    update();
  }


  void statusLoadingFalse(){
    userLoading=false;
    update();
  }
  void statusLoadingTrue(){
    userLoading=true;
    update();
  }

  Future<bool> getUserDataFromFireStore()async{
    UserModelApp tmpUserFS = await fireStoreUserInfo.getUserInfo(firebaseAuth.currentUser.uid,firebaseAuth.currentUser.email);
    if(tmpUserFS!=null){
      userFS=tmpUserFS;
      update();
      return true;
    }else{
      return false;
    }

  }




}
