import 'package:quiz_app/question_model.dart';

class QuizBrain {
  int _index = 0;
  int check = 1;
  final List<Questions> _myQuestion = [
    Questions(question: 'My name is Kamran', answer: true),
    Questions(question: 'Your name is Khan', answer: false),
    Questions(question: 'My contry name is Pakistan', answer: true)
  ];

  String getQuestion() {
    return _myQuestion[_index].question;
  }

  bool getAnswer() {
    return _myQuestion[_index].answer;
  }

  void nextQuestion() {
    if (_index < _myQuestion.length - 1) {
      _index++;
    }
    check++;
  }

  int getLength() {
    return _myQuestion.length;
  }

  bool endPoint() {
    if (check > _myQuestion.length) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _index = 0;
    check = 1;
  }
}
