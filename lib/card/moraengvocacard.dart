import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:moraeng/model/moraengvocamodel.dart';

class MoraengVocaCard extends StatefulWidget {
  MoraengVocaModel oneVoca;
  
  MoraengVocaCard({this.oneVoca,});

  @override
  _MoraengVocaCardState createState() => _MoraengVocaCardState();
}

class _MoraengVocaCardState extends State<MoraengVocaCard> {
  bool speaking=false;
  FlutterTts tts =FlutterTts();
  @override


  @override
  Widget build(BuildContext context) {

    return Container(
      width: 130,
      height: 90,
      padding: EdgeInsets.all(10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),

              blurRadius: 3,
              offset: Offset(3, 3), // Shadow position
            ),
          ],
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(widget.oneVoca.korean,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              Spacer(),
              GestureDetector(
                  onTap: ()async{
                    setState(() {
                      speaking=true;
                    });

                    tts.setLanguage('ko');
                    tts.setSpeechRate(0.4);

                    tts.speak(widget.oneVoca.korean);
                    Timer(Duration(milliseconds: widget.oneVoca.korean.length*400), (){
                      setState(() {
                        speaking=false;
                      });
                    } );


                  },
                  child: Icon(Icons.volume_up,color: speaking?Colors.orange:Colors.black,))
            ],
          ),
          SizedBox(height: 5,),
          Text(widget.oneVoca.other,style: TextStyle(fontWeight: FontWeight.bold),),
          // Text(widget.oneVoca.country),
          Text(widget.oneVoca.day.toString())


        ],
      ),
    );

  }
}
