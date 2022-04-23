// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:dictation_words/constants.dart';
import 'package:dictation_words/countdown.dart';
import 'package:dictation_words/wordsList.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  bool reset_switch = false;
  List<String> listWords = [];
  int selectedNum = 0;
  int selectedSecond = 10;
  // ignore: use_key_in_widget_constructors
  SecondScreen(
      {required this.listWords,
      required this.selectedNum,
      required this.selectedSecond});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

double getTextSize(context, List listWords) {
  double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
  double multiplier = 22;
  double multiplier2 = 15;
  double sizeOfWord = 0.0;
  if (listWords[0].length == 5) {
    sizeOfWord = 12 * unitHeightValue;
  } else if (listWords[0].length == 6) {
    sizeOfWord = 10 * unitHeightValue;
  } else if (listWords[0].length == 7) {
    sizeOfWord = 9 * unitHeightValue;
  } else if (listWords[0].length == 3) {
    sizeOfWord = 20 * unitHeightValue;
  } else if (listWords[0].length == 4) {
    sizeOfWord = 16 * unitHeightValue;
  }
  return sizeOfWord;
}

/*List<FadeAnimatedText> ReturnRandomWords(bool reset, int selectedNum,
    List<String> listWords, int selectedSecond, SecondScreen widget) {
  print("clicked reset");
  print(widget.listWords);
  widget.listWords.shuffle();
  List<FadeAnimatedText> tmp = [];
  if (reset) {
    for (int x = 0; x < selectedNum; x++) {
      tmp.add(FadeAnimatedText(listWords[x],
          duration: Duration(seconds: selectedSecond),
          fadeOutBegin: 0.3,
          fadeInEnd: 0.2));
    }
  } else {
    widget.dispose();
    }/

    print("got reset: " + reset.toString());
    for (int x = 0; x < 1; x++) {
      tmp.add(FadeAnimatedText("",
          duration: Duration(seconds: 0), fadeOutBegin: 0.3, fadeInEnd: 0.2));
    }
  }
  print("clicked reset completed");
  return tmp;
}*/

class _SecondScreenState extends State<SecondScreen> {
  var tempWords = <String>{};
  var tempWord = "dummy";

  // bool status = false;
  int counter = 0;

  Widget _fade() {
    /* widget.listWords.shuffle();
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double multiplier = 22;
    double multiplier2 = 15;
    print(tempWords);
    // = false;

    //return LayoutBuilder(builder: (context, constraints) {
    return SizedBox(
      child: DefaultTextStyle(
        style: TextStyle(
            //  fontSize: constraints.maxWidth > 700
            //     ? getTextSize(context, widget.listWords) + 5
            //    : getTextSize(context, widget.listWords),
            /*widget.listWords[0].length >= 5
            ? multiplier2 * unitHeightValue
            : multiplier * unitHeightValue,*/
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'ComicSansMS3'),
        child: Center(
          child: AnimatedTextKit(
            //  onFinished: () => status = true,
            repeatForever: true,
            onTap: () {},
            pause: Duration(seconds: 2),

            animatedTexts: [
              for (int x = 0; x < 3; x++)
                FadeAnimatedText(widget.listWords[x],
                    duration: Duration(seconds: widget.selectedSecond),
                    fadeOutBegin: 0.8,
                    fadeInEnd: 0.7),
            ],
          ),
        ),
      ),
    );
    // }
    // );*/
    widget.listWords.shuffle();
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double multiplier = 22;
    double multiplier2 = 15;
    print("After shuffle : ");
    print(widget.listWords);
    var rng = new Random();
    print("random word: " +
        widget.listWords[rng.nextInt(widget.listWords.length)]);
    print("counter is:" + widget.selectedNum.toString());
    return SizedBox(
      child: DefaultTextStyle(
        style: TextStyle(
            fontSize: widget.listWords[0].length >= 5
                ? multiplier2 * unitHeightValue
                : multiplier * unitHeightValue,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'ComicSansMS3'),
        child: Center(
          child: AnimatedTextKit(
              key: ValueKey(tempWord),
              repeatForever: true,
              // isRepeatingAnimation: false,
              //  onNext: _isPause?, repeatForever: true,
              onTap: () {
                widget.listWords.shuffle();
                setState(() {
                  tempWord =
                      widget.listWords[rng.nextInt(widget.listWords.length)];
                });
              },
              // pause: Duration(seconds: 1),
              animatedTexts: [
                // ReturnRandomWords(reset, widget.selectedNum,
                // widget.listWords, widget.selectedSecond, widget),
                for (int x = 0; x < widget.selectedNum; x++)
                  FadeAnimatedText(
                      widget.listWords[rng.nextInt(widget.listWords.length)] +
                          " => " +
                          x.toString(),
                      duration: Duration(seconds: widget.selectedSecond),
                      fadeOutBegin: 0.8,
                      fadeInEnd: 0.7),
              ]),
        ),
      ),
    );
  }

  void ResetCount() {
    _controller.start();
  }

  Widget _countdownTimer() {
    // status = true;
    return CircularCountDownTimer(
      key: UniqueKey(),
      initialDuration: 1,
      width: MediaQuery.of(context).size.width / 6,
      height: MediaQuery.of(context).size.height / 7,
      duration: widget.selectedSecond,
      fillColor: Colors.amber,
      ringColor: Colors.white,
      controller: _controller,
      backgroundColor: Colors.white54,
      strokeWidth: 3.0,
      strokeCap: StrokeCap.round,
      isTimerTextShown: true,
      isReverse: false,
      //add here
      onStart: () {
        //   Future.delayed(Duration(seconds: 3), () {
        // _fade();
        print('started');
        // });
      },
      onComplete: () {
        // print('Completed');

        print('cpmpleted');
        //};
        // if (mounted) {
        //  if (status == true) {
        //setState(() {});
        //  }
        //  }
        Future.delayed(Duration(seconds: 1), () {
          print('delayed');
          // _controller.restart();
          //setState(() {
          widget.listWords.shuffle();
          _controller.start();

          //  });
        }); // }
        // });
      },
      textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
    );
  }

  CountDownController _controller = CountDownController();

  bool _isPause = false;
  //@override
  /* void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      print('initstate started now');
    });
    // status = true;
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: prime_color,
              leading: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: IconButton(
                  // ignore: prefer_const_constructors
                  icon: Icon(
                    Icons.keyboard_return_sharp,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )),
          body: LayoutBuilder(builder: (context, constraints) {
            return SafeArea(
                //  mainAxisAlignment: MainAxisAlignment.center,
                //children: [
                child: Column(children: [
              Center(child: _countdownTimer()),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    _fade(),
                    SizedBox(
                      height: 70,
                    )
                  ]) //Column(children: [
              //    Center(child: _countdownTimer()
              /*CircularCountDownTimer(
                  key: UniqueKey(),
                  width: MediaQuery.of(context).size.width / 6,
                  height: MediaQuery.of(context).size.height / 7,
                  duration: widget.selectedSecond,
                  fillColor: Colors.amber,
                  ringColor: Colors.white,
                  controller: _controller,
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

                    Future.delayed(Duration(seconds: 3), () {
                      print('cpmpleted');
                      //};
                      if (mounted) {
                        setState(() {});
                      }
                    });
                  },
                  textStyle:
                      const TextStyle(fontSize: 25.0, color: Colors.black),
                ),*/
              //   ),
              /*  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    _fade(),
                    SizedBox(
                      height: 70,
                    )
                  ]),*/
              // ]
              //  )
              //   );
            ]));
          }),
          floatingActionButton: LayoutBuilder(builder: (context, constraints) {
            return Container(
              //  padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              height: constraints.maxWidth > 700 ? 100 : 70,
              width: constraints.maxWidth > 700 ? 120 : 70,
              // width: 70,
              child: FittedBox(
                child: FloatingActionButton(
                  backgroundColor: onPrime_color, // Colors.orange,
                  heroTag: 'hero1',
                  // hoverColor: Colors.green,
                  tooltip: 'Reset',
                  onPressed: () {
                    // _controller.pause();
                    _controller.restart();

                    Future.delayed(Duration(seconds: 5), () {
                      //   setState(() {
                      //   _fade();
                      _controller.start();
                      //     _countdownTimer();
                    });
                    // setState(() {
                    // _controller.pause();
                    print("pressed reset ..");
                    // _fade();
                    // setState(() {

                    // });
                    // setState(() {
                    widget.listWords.shuffle();
                    var rng = Random();
                    setState(() {
                      tempWord = widget
                          .listWords[rng.nextInt(widget.listWords.length)];
                      // widget.selectedNum -= 1;
                    });
                    _fade();
                    // });
                    // status = false;
                    /* Future.delayed(Duration(seconds: 4), () {
                      setState(() {
                        _fade();
                        _controller.start();
                      });
                    });*/
                    /*  setState(() {
                         if (status) {
                      _fade();
                    });
                    _controller.start();*/
                  },
                  child: Text(
                    'Reset',
                    style: butn_style,
                  ),
                ),
              ),
            );
          })),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // )
    );
  }

  /* @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _controller.
    // this.dispose();
  }*/
}
