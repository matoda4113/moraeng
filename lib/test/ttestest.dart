import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


class Home2 extends StatefulWidget {


  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  FlutterTts tts = FlutterTts();
  void firstWork()async{

    await tts.setSharedInstance(true);
    await tts
        .setIosAudioCategory(IosTextToSpeechAudioCategory.playAndRecord, [
      IosTextToSpeechAudioCategoryOptions.allowBluetooth,
      IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
      IosTextToSpeechAudioCategoryOptions.mixWithOthers
    ]);
    await tts.awaitSpeakCompletion(true);
    await tts.getLanguages;

  }
  bool isSpeaking=false;
  @override
  void initState() {
    tts.setErrorHandler((err) {
      setState(() {
        print("error occurred: " + err);
        isSpeaking = false;
      });
    });
    tts.setStartHandler(() {
      setState(() {
        isSpeaking = true;
        print(isSpeaking);
      });
    });
    tts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
        print(isSpeaking);
      });
    });
    tts.setLanguage('ko-Standard-D');
    tts.setSpeechRate(0.4);
    // firstWork();
    // TODO: implement initState
    super.initState();
  }


  final TextEditingController controller =
  TextEditingController(text: 'Hello world');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(isSpeaking.toString()),
          TextField(
            controller: controller,
          ),
          ElevatedButton(
              onPressed: () {
                tts.speak(controller.text);
              },
              child: Text('Speak'))
        ],
      ),
    );
  }
}