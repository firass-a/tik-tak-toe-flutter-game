import 'package:flutter/material.dart';
import 'screens/game.dart';

void main() {
  runApp(TikTak());
}

class TikTak extends StatelessWidget {
  const TikTak({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: game(),
    );
  }
}
