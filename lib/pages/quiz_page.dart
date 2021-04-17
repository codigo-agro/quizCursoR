import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quiz_01/componentes/centered_circular_progress.dart';
import 'package:quiz_01/componentes/centered_message.dart';
import 'package:quiz_01/componentes/finish_dialog.dart';
import 'package:quiz_01/componentes/result_dialog.dart';
import 'package:quiz_01/controllers/quiz_controller.dart';
import 'package:quiz_01/pages/choice.quiz.dart';
import 'package:quiz_01/pages/home.page.dart';
import 'package:quiz_01/widgets/logo.widget.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final _controller = QuizController();
  List<Widget> _scoreKeeper = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _controller.initialize();

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Quiz ( ${_scoreKeeper.length}/${_controller.questionsNumber} )',
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'Merriweather',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyHomePage();
              }));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.playlist_play,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChoiceQuiz();
              }));
            },
          )
        ],
      ),
      backgroundColor: Color(0xFF696969),
      body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/fundo10.jpeg"),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: _buildQuiz(),
              ))),
    );
  }

  _buildQuiz() {
    if (_loading) return CenteredCircularProgress();

    if (_controller.questionsNumber == 0)
      return CenteredMessage(
        'Sem questões',
        icon: Icons.warning,
      );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildQuestion(_controller.getQuestion()),
        _buildAnswerButton(_controller.getAnswer1()),
        _buildAnswerButton(_controller.getAnswer2()),
        _buildScoreKeeper(),
      ],
    );
  }

  _buildQuestion(String question) {
    return Expanded(
        flex: 5,
        child: ListView(children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Merriweather',
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ]));
  }

  _buildAnswerButton(String answer) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: AutoSizeText(
                answer,
                maxLines: 2,
                minFontSize: 12.0,
                maxFontSize: 12.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Merriweather',
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          onTap: () {
            bool correct = _controller.correctAnswer(answer);

            ResultDialog.show(
              context,
              question: _controller.question,
              correct: correct,
              onNext: () {
                setState(() {
                  _scoreKeeper.add(
                    Icon(
                      correct ? Icons.check : Icons.close,
                      color: correct ? Colors.green : Colors.red,
                    ),
                  );

                  if (_scoreKeeper.length < _controller.questionsNumber) {
                    _controller.nextQuestion();
                  } else {
                    FinishDialog.show(context,
                        hitNumber: _controller.hitNumber,
                        questionNumber: _controller.questionsNumber);
                  }
                });
              },
            );
          },
        ),
      ),
    );
  }

  _buildScoreKeeper() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _scoreKeeper,
      ),
    );
  }
}
