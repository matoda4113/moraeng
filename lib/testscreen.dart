import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moraeng/provider/postprovider.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 100,),
          ElevatedButton(
              onPressed: (){
                String id=getRandomString(16);
                FirebaseFirestore fireStore=FirebaseFirestore.instance;
                fireStore.collection('Posts').doc(id).set({
                "id":id,
                "title":"sdf",
                "thumbnail":"",
                });
              },
              child: Text("업")
          )
        ],
      ),
    );
  }
}
