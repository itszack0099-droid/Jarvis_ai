import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  final SpeechToText _speech = SpeechToText();

  Future<String> listen() async {
    bool available = await _speech.initialize();

    if (!available) {
      return "Speech not available";
    }

    String words = "";

    _speech.listen(
      onResult: (result) {
        words = result.recognizedWords;
      },
    );

    // listen for 4 seconds
    await Future.delayed(const Duration(seconds: 4));

    await _speech.stop();

    return words;
  }
}
