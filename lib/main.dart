import 'package:flutter/material.dart';

void main() {
  runApp(const MeloApp());
}

class MeloApp extends StatelessWidget {
  const MeloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Melo',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF071B0D),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8BCF36),
          brightness: Brightness.dark,
        ),
      ),
      home: const MeloHome(),
    );
  }
}

class MeloHome extends StatelessWidget {
  const MeloHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.chat_bubble_rounded,
                size: 90,
                color: Color(0xFF8BCF36),
              ),
              const SizedBox(height: 20),
              const Text(
                'Melo',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8BCF36),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Chat. Share. Connect.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
