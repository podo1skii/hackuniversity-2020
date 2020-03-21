import 'package:speech_recognition/speech_recognition.dart';

class SpeechModule {
  SpeechRecognition get instance => _speech;
  SpeechRecognition _speech;
  bool _speechRecognitionAvailable;
  String _currentLocale;
  bool _isListening = false;
  String transcription;
    SpeechModule() {
      _speech = SpeechRecognition();

// The flutter app not only call methods on the host platform,
// it also needs to receive method calls from host.
      _speech.setAvailabilityHandler((bool result) {
        _speechRecognitionAvailable = result;
      });

// handle device current locale detection
      _speech.setCurrentLocaleHandler((String locale){
        _currentLocale = locale;
      });

      _speech.setRecognitionStartedHandler(() {
        _isListening = true;
      });

// this handler will be called during recognition.
// the iOS API sends intermediate results,
// On my Android device, only the final transcription is received
      _speech.setRecognitionResultHandler((String text) {
        transcription = text;
      });

      _speech.setRecognitionCompleteHandler((){
        _isListening = false;
      });

// 1st launch : speech recognition permission / initialization
      _speech
          .activate()
          .then((res) {
        _speechRecognitionAvailable = res;
      });
//..
    }

  Future<void> start() async {
      print('Start');
    await _speech.listen(locale: 'ru_RU');
    print(_isListening);
    print('Transcription:' + transcription);
  }

  Future<void> stop() async {
      print('STOP');
      await _speech.stop();
    await _speech.cancel();
      print(_isListening);
    print('Result: '+ transcription);
  }
}
