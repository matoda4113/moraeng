import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moraeng/model/moraengvocamodel.dart';
import 'package:moraeng/service/firebasepost.dart';
import 'package:moraeng/service/firebasevoca.dart';
import 'package:http/http.dart' as http;

class VocaProvider extends GetxController {
  FirebaseVoca firebaseVoca = FirebaseVoca();

  List<MoraengVocaModel> vocaList=[];
  List<MoraengVocaModel> todayVocaList=[];


  Future<void> getVocaList(String country) async {

    List<MoraengVocaModel> vocaInfoTmp = [];

    try {

      DocumentSnapshot vocaListDocTest= await firebaseVoca.getVocaList(country);
      DocumentSnapshot vocaListDoc;
      if(vocaListDocTest.exists){
        vocaListDoc=vocaListDocTest;
      }else{
        vocaListDoc= await firebaseVoca.getVocaList('en');
      }


      String vocaJsonUrl=vocaListDoc.get('url');
      var response =await http.get(Uri.parse(vocaJsonUrl));

      String responseBody = utf8.decode(response.bodyBytes);

      print(responseBody);

      Map<String,dynamic> contentsMap = jsonDecode(responseBody);

      print(contentsMap);
      MoraengVocaModelJson vocaJson = MoraengVocaModelJson.fromJson(contentsMap);
      for(int i=0;i<vocaJson.korean.length;i++ ){
        MoraengVocaModel tmpVoca=new MoraengVocaModel();
        tmpVoca.korean=vocaJson.korean[i];
        tmpVoca.other=vocaJson.other[i];
        tmpVoca.url=vocaJson.url[i];
        tmpVoca.day=vocaJson.day[i];
        tmpVoca.language=vocaJson.language;
        vocaInfoTmp.add(tmpVoca);
      }
      vocaList=vocaInfoTmp;

      todayVocaList=vocaInfoTmp.where((element) => element.day==DateTime.now().weekday).toList();

      update();
    } catch (e) {
      print(e);
    }



  }


}
