import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jarvis AI"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print("Assistant Start");
          },
          child: const Text("Start Assistant"),
        ),
      ),
    );
  }
}
