import 'package:flutter/material.dart';
import 'services/speech_service.dart';
import 'services/tts_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SpeechService speech = SpeechService();
  final TTSService tts = TTSService();

  String text = "Press button to start";

  Future<void> startAssistant() async {
    setState(() {
      text = "Listening...";
    });

    String words = await speech.listen();

    setState(() {
      text = words;
    });

    if (words.isEmpty) {
      await tts.speak("I did not hear anything");
    } else {
      await tts.speak("You said $words");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jarvis AI"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: startAssistant,
              child: const Text("Start Assistant"),
            ),
          ],
        ),
      ),
    );
  }
}