import 'package:cronometro/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Cronometro());
}

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronômetro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
