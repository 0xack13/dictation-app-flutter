// ignore_for_file: prefer_const_constructors

import 'home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introDate = GetStorage();

  void endWelcomingPage(context) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    introDate.write('displayed', true);
  }

  List<PageViewModel> pagesView() {
    return [
      PageViewModel(
          title: 'assets/wingpng.png',
          body:
              'Dictatation is an intensive activity that make kids concentrate and help them to develop short-term memorys',
          image: Image.asset('assets/pngwing.png')),
      PageViewModel(
          title: 'assets/pngwing.png',
          body: '',
          image: Image.asset('assets/pngwing.png')),
      PageViewModel(
          title: '', body: '', image: Image.asset('assets/pngwing.png')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: IntroductionScreen(
        showDoneButton: true,
        showNextButton: true,
        showSkipButton: true,
        done: Text('done'),
        skip: Text('skip'),
        next: Text('next'),
        onDone: () => endWelcomingPage(context),
        onSkip: () => endWelcomingPage(context),
        pages: pagesView(),
      )),
    );
  }
}
