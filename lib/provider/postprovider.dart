import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moraeng/service/firebasepost.dart';

class PostProvider extends GetxController {
  FirebasePost firebasePost = FirebasePost();

  QuerySnapshot recommendedPost;

  RxInt testPost=1.obs;

  void plus(){
    testPost++;
    update();
  }

  Future<void> getRecommendedPost() async {

    recommendedPost = await firebasePost.getRecommendedPost();

    update();

  }


}
