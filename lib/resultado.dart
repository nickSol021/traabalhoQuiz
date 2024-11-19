import 'package:flutter/material.dart';
import 'telaInicial.dart'; 

class Resultado extends StatelessWidget {
  final int score;
  final String participantName;

  const Resultado({super.key, required this.score, required this.participantName});

  String _avaliarDesempenho(int score) {
    if (score <= 3) {
      return 'A prática leva à perfeição!';
    } else if (score <= 7) {
      return 'Continue tentando!';
    } else {
      return 'Uau! você entende do assunto.';
    }
  }

  void _restartQuiz(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const TelaInicial(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Muito bem, $participantName!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Sua pontuação foi: $score',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              _avaliarDesempenho(score), 
              style: const TextStyle(fontSize: 18,
              fontWeight: FontWeight.w500, 
              color: Color.fromARGB(255, 179, 167, 64)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _restartQuiz(context), 
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 104, 25, 29), 
              foregroundColor: Colors.white,    
            ),
              child: const Text('Reiniciar Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
 

