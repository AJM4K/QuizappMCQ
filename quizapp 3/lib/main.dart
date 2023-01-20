import 'package:flutter/material.dart';
//////////////  🚨🚨🚨  🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 //////////////////
// Add import For Alert Package
import 'package:rflutter_alert/rflutter_alert.dart';
////////////////////////////////////////////////////////


import 'quiz_brain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Quiz App"),),
        backgroundColor: Colors.blue[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = new QuizBrain();

  // List For Icons
  List<Icon> scoreKeper = [];

// new int question number tracker
  int order=1 ;

  void checkAnswer(bool userAswer)
  {



    //////////////  🚨🚨🚨  🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 //////////////////
//////////////// A new part, which we did not cover in class ( If there are no new Question, notify the user with an alert message. )
    // Note : In order to use Alert You must Download the package from below link 👇👇
    // https://pub.dev/packages/rflutter_alert


    //if There is no more Question
    if(quizBrain.checknext() == false ) {
      Alert(context: context, title: "Alert", desc: "The test is over :) ").show();

      setState(()
      {
        // Reset Question Counter
        quizBrain.resetnumber();
        // Reset Icons List
        scoreKeper = [];
      });


    }
    //If there are any additional questions check answer and display ICon
    else
    {
      setState(()
      {
        if (quizBrain.getquestionAnswer() == userAswer) {
          scoreKeper.add(Icon(Icons.check, color: Colors.green,));
        }
        else
        {
          scoreKeper.add(Icon(Icons.close, color: Colors.red,));
        }

        quizBrain.nextQuestion();
      }
      );
    }

    setState(() {
      order = quizBrain.order();
      order = order+1;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Card(
               color: Colors.white70,

              child: Center(
                child: Text(
                  'Question $order of 6',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getquestiontext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
    onPressed: () {
    checkAnswer(true);

    },
    style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                 Container(
    padding: EdgeInsets.only(left: 7),
                   child: Text(
                        'True',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                 ),


                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(

              onPressed: () {
                checkAnswer(false);
                //The user picked false.
              },
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                   Container(
                     padding: EdgeInsets.only(left: 7),
                     child: Text(
                        'False',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                   ),


                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  quizBrain.shuffle();
                });


                //The user picked false.
              },
              style: TextButton.styleFrom(backgroundColor: Colors.amber
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(Icons.shuffle
                  ,color: Colors.black,),

                   Container(
                     padding: EdgeInsets.only(left: 7),
                     child: Text(
                        'Shuffle questions',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                   ),


                ],
              ),
            ),
          ),
        ),


        Row(children: scoreKeper,)
      ],
    );
  }
}