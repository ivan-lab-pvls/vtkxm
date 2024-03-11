import 'package:flutter/material.dart';

class FinalQuizPage extends StatelessWidget {
  const FinalQuizPage({super.key, required this.score});
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(18, 60, 18, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Score',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w700,
                            fontSize: 32)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: score == 5
                          ? Text('You\'re pretty good with cars',
                              style: TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.3),
                                  fontSize: 16))
                          : score == 4
                              ? Text('That was close.',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.3),
                                      fontSize: 16))
                              : Text('Try next time. It will be better!',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.3),
                                      fontSize: 16)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$score/10',
                            style: const TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0075FF),
                                fontSize: 18),
                          ),
                          Row(
                            children: [
                              Flexible(
                                  child: score == 5
                                      ? Text(
                                          'You have successfully answered all the questions, way to go!',
                                          style: TextStyle(
                                              fontFamily: 'SF Pro Text',
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        )
                                      : score == 4
                                          ? Text(
                                              'You almost answered all the questions, way to go!',
                                              style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14),
                                            )
                                          : score == 0
                                              ? Text(
                                                  'Try next time!',
                                                  style: TextStyle(
                                                      fontFamily: 'SF Pro Text',
                                                      color: Colors.black
                                                          .withOpacity(0.6),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14),
                                                )
                                              : Text(
                                                  'It was close, try next time!',
                                                  style: TextStyle(
                                                      fontFamily: 'SF Pro Text',
                                                      color: Colors.black
                                                          .withOpacity(0.6),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14),
                                                )),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: const Color(0xFF0075FF),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    'Go to main',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}