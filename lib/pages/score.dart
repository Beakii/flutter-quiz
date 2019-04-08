import 'package:flutter/material.dart';
import './landing_page.dart';

class ScorePage extends StatelessWidget{

  final int score;
  final int totalQuestion;

  ScorePage(this.score, this.totalQuestion);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Your score: ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
            ),
          ),
          Text(score.toString() + "/" + totalQuestion.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 50.0,
              ),
            ),
          IconButton(
            icon: Icon(Icons.keyboard_return),
            color: Colors.white,
            iconSize: 100,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LandingPage()), (Route route) => route == null),
          ),
        ],
      ),
    );
  }
}