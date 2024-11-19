import 'package:flutter/material.dart';
import 'quiz.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _startQuiz() {
    final String name = _nameController.text.trim();
    if (name.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizScreen(participantName: name),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, insira seu nome.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FORMULA QU1Z'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Aumentando a imagem
            Image.asset(
              'lib/assets/imagemInicial.jpg',
              width: double.infinity,  // Faz a imagem ocupar toda a largura disponível
              height: 400,             // Define uma altura fixa (você pode ajustar conforme necessário)
              fit: BoxFit.contain,     // Ajusta a imagem sem cortar
            ),
            const SizedBox(height: 25),
            const Text(
              'Sua largada começa aqui!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Digite seu nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startQuiz,
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 104, 25, 29), // Use backgroundColor for the button's background color
              foregroundColor: Colors.white,      // Use foregroundColor for the text color
  ),
  child: const Text('Iniciar Quiz'),
)

          ],
        ),
      ),
    );
  }
}
