import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../ui/answerbutton.dart';
import '../ui/questiontext.dart';
import '../ui/answeroverlay.dart';
import './score.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = Quiz([
    Question("A penny dropped from a tall building can reach sufficient velocity to kill a pedestrian below.", false),
    Question("Other than water, coffee is the world's most popular drink.", true),
    Question("When Mattel introduced Barbie in 1959, parental outrage focused on the doll's high price tag.", false),
    Question("Flight recorders onboard planes are painted black boxes.", false),
    Question("Harry Potter's archenemy is Tom Marvolo Riddle.", true),
    Question("Ostriches bury their heads up to 18 inches in the sand.", false),
    Question("According to the Declaration of Independence, the people \"have nothing to lose but their chains.\"", false),
    Question("The \"China Syndrome\" is what hostages experience when they begin to feel empathy for their captors.", false),
    Question("Louis Braille, creator of the Braille system of writing for the blind, was himself blind.", true),
    Question("The Oscar-winning film Guess Who's Coming to Dinner (1967) deals with interracial marriage.", true),
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayIsVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState((){
      overlayIsVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          children: <Widget>[
            AnswerButton(true, () => handleAnswer(true)),
            QuestionText(questionText, questionNumber),
            AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        overlayIsVisible == true ? AnswerOverlay(
          isCorrect, (){
            currentQuestion = quiz.nextQuestion;
            this.setState((){
              if(quiz.length == questionNumber){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
                return;
              }
              overlayIsVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }) : Container(),
      ],
    );
  }
}
