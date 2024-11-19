import 'package:flutter/material.dart';
import 'telaInicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 41, 3, 3)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 104, 25, 16),  
          titleTextStyle: TextStyle(
            color: Colors.white,  
            fontSize: 24,          
            fontWeight: FontWeight.bold, 
          ),
        ),
        useMaterial3: true,
      ),
      home: const TelaInicial(),
    );
  }
}
