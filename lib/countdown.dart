// ignore_for_file: prefer_const_constructors

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CountDown extends StatelessWidget {
  const CountDown(Required required, start, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CountDown({this.start, this.complete});
    final int complete;
    final int start;
    var selectedtime;
    return Center(
        child: CircularCountDownTimer(
            key: UniqueKey(),
            width: MediaQuery.of(context).size.width / 6,
            height: MediaQuery.of(context).size.height / 7,
            duration: selectedtime,
            fillColor: Colors.amber,
            ringColor: Colors.white,
            // controller: _controller,
            backgroundColor: Colors.white54,
            strokeWidth: 3.0,
            strokeCap: StrokeCap.round,
            isTimerTextShown: true,
            isReverse: false,
            //add here
            onStart: () {
              Future.delayed(Duration(seconds: 2), () {
                print('started');
              });
            },
            onComplete: () {
              // print('Completed');

              Future.delayed(
                Duration(seconds: 3),
                () {
                  print('cpmpleted');
                  //};
                  //if (mounted) {
                  //   setState(() {});
                  // }
                  //});
                },
                // textStyle:
                //  const TextStyle(fontSize: 25.0, color: Colors.black),
              );
              //   ),
            }));
  }
}
