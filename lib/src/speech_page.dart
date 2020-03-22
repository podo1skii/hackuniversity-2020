import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

import 'application.dart';
import 'book_info_page.dart';
import 'builders/command_view_builder.dart';
import 'command_module.dart';
import 'models/book.dart';

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

class Speech extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Speech> {
  SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';

  Language selectedLang = const Language('Pусский', 'ru_RU');

  @override
  initState() {
    super.initState();
    activateSpeechRecognizer();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setCurrentLocaleHandler(onCurrentLocale);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech
        .activate()
        .then((res) => setState(() => _speechRecognitionAvailable = res));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPressStart: (_) {
          setState(() => transcription = '');
          _isListening = true;
          start();
        },
        onLongPressUp: () async {
          stop();
          _isListening = false;
          Future.delayed(Duration(milliseconds: 500), (){
            print('Future.delayed');
            (Application.command..context = context).sendCommandResponse(transcription);
          });
        },
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            color: _isListening ? Colors.red : Color.fromRGBO(59,86,233, 1),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(color: Colors.transparent),
          ),
          child: Icon(
            IconData(58141, fontFamily: 'MaterialIcons'),
            size: 25.0,
            color: Colors.white,
          ),
        ),
      );
  }

  void start() => _speech
      .listen(locale: selectedLang.code)
      .then((result) => print('_MyAppState.start => result $result'));

  void cancel() =>
      _speech.cancel().then((result) => setState(() => _isListening = result));

  void stop() => _speech.stop().then((result) {
        setState(() => _isListening = result);
      });

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onCurrentLocale(String locale) {
    print('_MyAppState.onCurrentLocale... $locale');
    setState(() => selectedLang = const Language('Pусский', 'ru_RU'));
  }

  void onRecognitionStarted() => setState(() => _isListening = true);

  void onRecognitionResult(String text) => setState(() => transcription = text);

  void onRecognitionComplete() => setState(() => _isListening = false);

  void errorHandler() => activateSpeechRecognizer();
}
