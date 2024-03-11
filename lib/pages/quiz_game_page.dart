import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:repair_mate_app/pages/answer_item.dart';
import 'package:repair_mate_app/pages/final_quiz_page.dart';

import 'question_item.dart';

enum EQuizType { financialLiteracy, bankingProducts, investments }

class QuizGamePage extends StatefulWidget {
  const QuizGamePage({
    super.key,
  });

  @override
  State<QuizGamePage> createState() => _QuizGamePageState();
}

class _QuizGamePageState extends State<QuizGamePage> {
  List<QuestionItem> carsQuestions = [
    QuestionItem(
        title: 'What was the first car to be mass-produced?',
        answers: [
          AnswerItem(title: 'Ford Model T', isCorrect: true),
          AnswerItem(title: 'Volkswagen Beetle', isCorrect: false),
          AnswerItem(title: 'Toyota Corolla', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is the most popular type of car in the United States?',
        answers: [
          AnswerItem(title: 'Sedan', isCorrect: false),
          AnswerItem(title: 'SUV', isCorrect: false),
          AnswerItem(title: 'Pickup truck', isCorrect: true),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'Who invented the first car?',
        answers: [
          AnswerItem(title: 'Karl Benz', isCorrect: true),
          AnswerItem(title: 'Henry Ford', isCorrect: false),
          AnswerItem(title: 'Gottlieb Daimler', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is the name of the world\'s first electric car?',
        answers: [
          AnswerItem(title: 'Waverley Electric Brougham', isCorrect: false),
          AnswerItem(title: 'Flocken Elektrowagen', isCorrect: true),
          AnswerItem(title: 'Detroit Electric', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'Which car company has the highest sales in the world?',
        answers: [
          AnswerItem(title: 'Toyota', isCorrect: true),
          AnswerItem(title: 'Volkswagen', isCorrect: false),
          AnswerItem(title: 'General Motors', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is the most expensive car ever sold at auction?',
        answers: [
          AnswerItem(
              title: 'Mercedes-Benz 300 SLR Uhlenhaut Coupé', isCorrect: false),
          AnswerItem(title: 'Bugatti La Voiture Noire', isCorrect: false),
          AnswerItem(title: 'Ferrari 250 GTO', isCorrect: true),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is the fastest land vehicle in the world?',
        answers: [
          AnswerItem(title: 'Bloodhound LSR', isCorrect: true),
          AnswerItem(title: 'ThrustSSC', isCorrect: false),
          AnswerItem(title: 'Hennessey Venom F5', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is the name of the world\'s first hybrid car?',
        answers: [
          AnswerItem(title: 'Honda Insight', isCorrect: false),
          AnswerItem(title: 'Toyota Prius', isCorrect: true),
          AnswerItem(title: 'Ford Fusion Hybrid', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is the name of the world\'s first self-driving car?',
        answers: [
          AnswerItem(title: 'Tesla\'s Autopilot', isCorrect: false),
          AnswerItem(title: 'Google\'s Waymo', isCorrect: true),
          AnswerItem(title: 'Apple\'s Project Titan', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is the most popular car color in the world?',
        answers: [
          AnswerItem(title: 'White', isCorrect: false),
          AnswerItem(title: 'Black', isCorrect: true),
          AnswerItem(title: 'Silver', isCorrect: false),
        ],
        isCompleted: false),
  ];

  List colors = [
    const Color(0xFFE334FF),
    const Color(0xFF3B4DF0),
    const Color(0xFFA045FB),
    const Color(0xFFF475B2),
  ];

  int index = 0;

  int questionNumber = 0;
  QuestionItem currentQuestion = QuestionItem();
  int correctAnswers = 0;
  String currentImage = '';
  @override
  void initState() {
    super.initState();
    carsQuestions.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    Map<int, QuestionItem> quastionMap = {};
    quastionMap = carsQuestions.asMap();

    quastionMap.forEach((key, value) {
      if (key == questionNumber) {
        currentQuestion = value;
        int first = Random().nextInt(3);
        int second = Random().nextInt(3);
        if (currentQuestion.isCompleted == false ||
            currentQuestion.isCompleted == null) {
          currentQuestion.answers!.swap(first, second);
        }
      }
    });
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 37),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.chevron_left,
                      ),
                      LinearPercentIndicator(
                        width: 120.0,
                        barRadius: const Radius.circular(7),
                        lineHeight: 8.0,
                        percent: 0.1 * (questionNumber + 1),
                        progressColor: const Color(0xFF0075FF),
                      ),
                      Text(
                        '${questionNumber + 1}/10',
                        style: const TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32, top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              currentQuestion.title!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: currentQuestion.isCompleted == null ||
                              !currentQuestion.isCompleted!
                          ? const EdgeInsets.only(bottom: 20)
                          : EdgeInsets.zero,
                      child: getAnswers(),
                    ),
                  ],
                ),
              ),
              if (currentQuestion.isCompleted != null &&
                  currentQuestion.isCompleted!)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
                  child: InkWell(
                    onTap: () {
                      if (questionNumber < 9) {
                        questionNumber++;
                      } else {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => FinalQuizPage(
                                    score: correctAnswers,
                                  )),
                        );
                      }
                      setState(() {});
                    },
                    child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: const Color(0xFF0075FF),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          'Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SF Pro Text',
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
            ],
          ),
          if (currentQuestion.isCompleted != null &&
              currentQuestion.isCompleted!)
            Container(
              width: double.infinity,
              height: 215,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  color: currentQuestion.isCorrect != null
                      ? currentQuestion.isCorrect!
                          ? const Color(0xFF3ED684)
                          : const Color(0xFFE35454)
                      : const Color(0xFF3ED684)),
              child: currentQuestion.isCorrect!
                  ? Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 24),
                        child: Text(
                          'Correct!',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'That was good',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      )
                    ])
                  : Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 24),
                        child: Text(
                          'Incorrect!',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'That was close',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
            )
        ],
      ),
    );
  }

  Widget getAnswers() {
    List<Widget> list = [];

    for (var answer in currentQuestion.answers!) {
      list.add(InkWell(
        onTap: () {
          if (currentQuestion.isCompleted == null ||
              currentQuestion.isCompleted == false) {
            currentQuestion.isCompleted = true;
            if (answer.isCorrect!) {
              correctAnswers++;
            }
            currentQuestion.isCorrect = answer.isCorrect;
            setState(() {});
          }
        },
        child: Container(
          height: 122,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: MediaQuery.of(context).size.width / 2 - 25,
          decoration: BoxDecoration(
              color: currentQuestion.isCompleted != null
                  ? currentQuestion.isCompleted!
                      ? answer.isCorrect!
                          ? Colors.green
                          : Colors.red
                      : colors[Random().nextInt(colors.length)]
                  : colors[Random().nextInt(colors.length)],
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                answer.title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ));
    }

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 20,
      children: list,
    );
  }
}