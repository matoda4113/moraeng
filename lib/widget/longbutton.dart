import 'package:flutter/material.dart';

class LongButton extends StatefulWidget {
  String name;
  Color color;
  Function widgetFunction;

  LongButton({this.name, this.color,this.widgetFunction});

  @override
  _LongButtonState createState() => _LongButtonState();
}

class _LongButtonState extends State<LongButton> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(widget.name),
        onPressed: () {
          widget.widgetFunction();
        },
        style: ElevatedButton.styleFrom(

            primary: widget.color,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            textStyle: TextStyle(
                fontSize: 20,

                fontWeight: FontWeight.bold)),
      ),
    );

  }
}
