import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void startAssistant() {
    print("Assistant started");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jarvis AI"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: startAssistant,
          child: const Text("Start Assistant"),
        ),
      ),
    );
  }
}