import 'package:flutter/material.dart';

class SNSAuthWidget extends StatefulWidget {

  int type;

  SNSAuthWidget(this.type);

  @override
  _SNSAuthWidgetState createState() => _SNSAuthWidgetState();
}

class _SNSAuthWidgetState extends State<SNSAuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 100,
                height: 50,
                child: Divider(height: 20,color: Colors.black,)),
            SizedBox(width: 10,),
            Text(widget.type==0?"SNS 로그인":"SNS 회원가입"),
            SizedBox(width: 10,),
            Container(
                width: 100,
                height: 50,
                child: Divider(height: 20,color: Colors.black,)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              elevation: 4.0,
              shape: CircleBorder(),
              clipBehavior: Clip.hardEdge,
              color: Colors.transparent,
              child: Ink.image(
                image: AssetImage('assets/image/kakaologo.jpeg'),
                fit: BoxFit.cover,
                width: 50.0,
                height: 50.0,
                child: InkWell(
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(width: 30,),
            Material(
              elevation: 4.0,
              shape: CircleBorder(),
              clipBehavior: Clip.hardEdge,
              color: Colors.transparent,
              child: Ink.image(
                image: AssetImage('assets/image/naverlogo.jpeg'),
                fit: BoxFit.cover,
                width: 50.0,
                height: 50.0,
                child: InkWell(
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(width: 30,),
            Material(
              elevation: 4.0,
              shape: CircleBorder(),
              clipBehavior: Clip.hardEdge,
              color: Colors.transparent,
              child: Ink.image(
                image: AssetImage('assets/image/googlelogo.jpeg'),
                fit: BoxFit.cover,
                width: 50.0,
                height: 50.0,
                child: InkWell(
                  onTap: () {},
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
