import 'package:flutter/material.dart';
import 'package:quiz_app/data.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> marking = [];

  int index = 0;
  int correct = 0;
  int wrong = 0;
  void checkAnswer(bool val) {
    if (quizBrain.endPoint() == false) {
      if (val == quizBrain.getAnswer()) {
        marking.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
        correct++;
      } else {
        marking.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
        wrong++;
      }
      setState(() {
        quizBrain.nextQuestion();
      });
    } else {
      Alert(
              context: context,
              title: 'Quiz End',
              type: AlertType.success,
              desc: 'You score is $correct out of ${quizBrain.getLength()}')
          .show();
      quizBrain.reset();
      marking = [];
      correct = 0;
      wrong = 0;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    checkAnswer(true);
                  },
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      'True',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    checkAnswer(false);
                  },
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      'False',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: marking,
            ),
          )
        ],
      ),
    );
  }
}
