import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'resultado.dart';

class QuizScreen extends StatefulWidget {
  final String participantName;

  const QuizScreen({super.key, required this.participantName});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _totalScore = 0;
  int? _selectedAnswerIndex;
  bool _isAnswered = false;
  final ConfettiController _confettiController = 
      ConfettiController(duration: const Duration(milliseconds: 100));


  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Quantos campeonatos a Ferrari ganhou?', //1
      'imagePath': 'lib/assets/perg1.jpg',
      'answers': [
        {'text': '10', 'score': 0},
        {'text': '19', 'score': 0},
        {'text': '35', 'score': 0},
        {'text': '16', 'score': 1},
      ],
    },
    {
      'questionText': 'Em que ano foi realizada a primeira corrida oficial de Fórmula 1?', //2
      'imagePath': 'lib/assets/perg2.jpg',
      'answers': [
        {'text': '1954', 'score': 0},
        {'text': '1950', 'score': 1},
        {'text': '1980', 'score': 0},
        {'text': '1945', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual o circuito mais longo do calendário atual da Fórmula 1?',//3
      'imagePath': 'lib/assets/perg3.jpg',
      'answers': [
        {'text': 'Circuito de Mônaco', 'score': 0},
        {'text': 'Silverstone', 'score': 0},
        {'text': 'Circuito de Spa-Francorchamps', 'score': 1},
        {'text': 'Suzuka', 'score': 0},
      ],
    },
    {
      'questionText': 'Quantos pilotos do grid atual possuem Grand Chelem?', ///4
      'imagePath': 'lib/assets/perg4.jpg',
      'answers': [
        {'text': '4', 'score': 1},
        {'text': '2', 'score': 0},
        {'text': '5', 'score': 0},
        {'text': '1', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual piloto é conhecido como “O Professor” por seu estilo calculado de dirigir?', //5
      'imagePath': 'lib/assets/perg5.jpg',
      'answers': [
        {'text': 'Michael Schumacher', 'score': 0},
        {'text': 'Niki Lauda', 'score': 0},
        {'text': 'Alain Prost', 'score': 1},
        {'text': 'Nigel Mansell', 'score': 0},// ver duhuihfihf
      ],
    },
    {
      'questionText': 'Em que anos Ayrton Senna conquistou seus três títulos mundiais de Fórmula 1?', //6 ver jifjsjfd
      'imagePath': 'lib/assets/perg6.jpg',
      'answers': [
        {'text': '1988, 1991, 1992', 'score': 0},
        {'text': '1988, 1989, 1992', 'score': 0},
        {'text': '1988, 1989, 1991', 'score': 0},
        {'text': '1988, 1990, 1991', 'score': 1},
      ],
    },
    {
      'questionText': 'Quem é o piloto mais jovem a vencer um Grande Prêmio de Fórmula 1?', //7
      'imagePath': 'lib/assets/perg7.jpg',
      'answers': [
        {'text': 'Lewis Hamilton', 'score': 0},
        {'text': 'Max Verstappen', 'score': 1},
        {'text': 'Sebastian Vettel', 'score': 0},
        {'text': 'Fernando Alonso', 'score': 0},
      ],
    },
    {
      'questionText': 'Em qual equipe Sebastian Vettel fez sua estreia na Fórmula 1?', // 8
      'imagePath': 'lib/assets/perg8.jpg',
      'answers': [
        {'text': 'Red Bull Racing', 'score': 0},
        {'text': 'BMW Sauber', 'score': 1},
        {'text': 'Renault', 'score': 0},
        {'text': 'Toro Rosso', 'score': 0}, // ver ujdfiu
      ],
    },
    {
      'questionText': 'Qual era o nome do modelo do carro usado pela Copersucar em sua temporada de estreia?', //9
      'imagePath': 'lib/assets/perg9.jpg',
      'answers': [
        {'text': 'FD10', 'score': 0},
        {'text': 'FD001', 'score': 0},
        {'text': 'FD1', 'score': 0},
        {'text': 'FD01', 'score': 1},
      ],
    },
    {
      'questionText': 'Qual foi o último ano que um motor V12 esteve na Fórmula 1?', //10
      'imagePath': 'lib/assets/perg10.jpg',
      'answers': [
        {'text': '2001', 'score': 0},
        {'text': '1995', 'score': 1},
        {'text': '1993', 'score': 0},
        {'text': '1983', 'score': 0},
      ],
    },
  ];
  void _answerQuestion(int score, int answerIndex) {
    setState(() {
      _selectedAnswerIndex = answerIndex;
      _isAnswered = true;
      if (score > 0) {
        _totalScore += score;

        // Ativa a animação de confetes
        _confettiController.play();
      }
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (_questionIndex < _questions.length - 1) {
        setState(() {
          _questionIndex++;
          _selectedAnswerIndex = null;
          _isAnswered = false;
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Resultado(
              score: _totalScore,
              participantName: widget.participantName,
            ),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LinearProgressIndicator(
                value: (_questionIndex + 1) / _questions.length,
                backgroundColor: Colors.grey[300],
               // color: Colors.blue,
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: Padding(
                    key: ValueKey<int>(_questionIndex),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Questão ${_questionIndex + 1}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (_questions[_questionIndex].containsKey('imagePath'))
                          Image.asset(
                            _questions[_questionIndex]['imagePath'] as String,
                            width: double.infinity,
                            height: 300,
                          ),
                        const SizedBox(height: 20),
                        Text(
                          _questions[_questionIndex]['questionText'] as String,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        ...(_questions[_questionIndex]['answers']
                                as List<Map<String, Object>>)
                            .asMap()
                            .entries
                            .map((entry) {
                          final int index = entry.key;
                          final Map<String, Object> answer = entry.value;

                          Color buttonColor = const Color.fromARGB(255, 224, 221, 221);
                          if (_isAnswered) {
                            if (_selectedAnswerIndex == index) {
                              buttonColor = (answer['score'] as int) > 0
                                  ? Colors.green
                                  : Colors.red;
                            } else {
                              buttonColor = Colors.grey;
                            }
                          }

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeInOut,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ElevatedButton(
                              onPressed: _isAnswered
                                  ? null
                                  : () => _answerQuestion(
                                        answer['score'] as int,
                                        index,
                                      ),
                              style: 
                            ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Text(answer['text'] as String),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Widget do confete
          


  Align(
  alignment: Alignment.topCenter, // Confetes disparando da esquerda
  child: ConfettiWidget(
    confettiController: _confettiController,
    blastDirection: -3.14/2, // Confetes disparando para a esquerda
    emissionFrequency: 0.1,
    numberOfParticles: 70,
    //maxBlastForce: 10,
    minBlastForce: 5,
    gravity: 1.0,
  ),
),

  Align(
  alignment: Alignment.topLeft, // Confetes disparando da esquerda
  child: ConfettiWidget(
    confettiController: _confettiController,
    blastDirection: -3.14/2, // Confetes disparando para a esquerda
    emissionFrequency: 0.1,
    numberOfParticles: 60,
    //maxBlastForce: 10,
    minBlastForce: 5,
    gravity: 1.0,
  ),
),


Align(
  alignment: Alignment.topRight, // Confetes disparando da direita
  child: ConfettiWidget(
    confettiController: _confettiController,
    blastDirection: -3.14/2, // Confetes disparando para a direita
    emissionFrequency: 0.1,
    numberOfParticles: 60,
 //   maxBlastForce: 10,
    minBlastForce: 5,
    gravity: 1.0,
         ),
        ),
        ],
      ),
    );
  }
}