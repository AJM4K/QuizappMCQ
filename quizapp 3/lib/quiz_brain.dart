import 'question.dart';


class QuizBrain {
  int _questionumber=0;

  List<Question> _questionbank = [

    Question(q: 'The black box in a plane is black',a: false),
    Question(q: 'Marrakesh is the capital of Morocco',a: false),
    Question(q: 'An octopus has three hearts',a: true),
    Question(q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', a: false),
    Question(q: 'The total surface area of two human lungs is approximately 70 square metres.',a:true),
    Question(q:'Google was originally called \"Backrub\".', a:true),
  ];


// this is my new code add
  void shuffle(){
    _questionbank.shuffle();
  }
  // this is my new code add
  int order (){
    print('order quiz brain num question : $_questionumber');
    return _questionumber;
  }








  void nextQuestion()
  {

    if (_questionumber < _questionbank.length)

    {
      _questionumber++;
    }

  }








  //////////////  🚨🚨🚨  🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 //////////////////
//////////////// A new part, which we did not cover in class ( check if there is more Questions  )
  bool checknext()
  {
    if(_questionumber < _questionbank.length-1)
    {
      // Return true if there are additional questions.
      return true;
    }
    else
    {

      return false;
    }


  }
  ////////////////////////////////////////////////////////////////////////




  //////////////  🚨🚨🚨  🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 🚨🚨🚨 //////////////////
//////////////// A new part, which we did not cover in class ( Reset Counter )
  void resetnumber()
  {

    _questionumber =0;
  }
  //////////////////////////////////////////////////////////////////////////////









  String getquestiontext()
  {
    return _questionbank[_questionumber].questioeText;
  }






  bool getquestionAnswer()
  {
    return _questionbank[_questionumber].questionAnswer;
  }







}