// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:dictation_words/constants.dart';
import 'package:dictation_words/second_screen.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:numberpicker/numberpicker.dart';
//import 'package:responsive_flutter/responsive_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /* List<BasicJson> parseBasicJsons(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<BasicJson>((json) => BasicJson.fromJson(json)).toList();
  }*/

  // ignore: non_constant_identifier_names
  List wordsSample = [];
  int selectedNmberOfLetters = 3;
  int selectedNumberOfWords = 5;
  int selectedNumberOfSeconds = 5;
  void LoadJsonAsync() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/words.json");
    //print(data);
    List<dynamic> allOfwordsList = jsonDecode(data); //wordsSample
    // var user = User.fromJso n(userMap[1]);
    wordsSample = allOfwordsList
        .map<WordsModel>((json) => WordsModel.fromJson(json))
        .toList();

    // print('Howdy, ${wordsSample[0].name}! Your age is ${[0].length}');
    //print('${wordsSample[0].words_sample}.');
    // print('${wordsSample[0]}' + 'this is words sample');
    // print('$wordsList' + 'this is words list');
    // print(wordsSample[0].length);
  }

  @override
  void initState() {
    super.initState();
    LoadJsonAsync();
  }

  List<String> listOfWords(x) {
    List<String> wantedLength = [];
    for (int i = 0; i < wordsSample.length; i++) {
      if (wordsSample[i].length == x) {
        wantedLength = wordsSample[i].words_sample;
      }
    }
    print(wantedLength);

    return wantedLength;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: prime_color,
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "Dictation Words",
            style: title_style,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: Padding(
            padding: constraints.maxWidth > 700
                ? EdgeInsets.only(left: 30, top: 70)
                : EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Select Number Of Letters:',
                        style: constraints.maxWidth > 700 ? tex_sty2 : tex_sty,
                      ),
                      NumberPicker(
                          //   decoration: ,
                          selectedTextStyle: TextStyle(
                              fontSize: constraints.maxWidth > 700 ? 35 : 20,
                              color: prime_color),
                          //textStyle: TextStyle(fontSize: 40),
                          minValue: 3,
                          maxValue: 7,
                          value: selectedNmberOfLetters,
                          onChanged: (value) => setState(() {
                                selectedNmberOfLetters = value;
                              }))
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Select Number Of Words:',
                        style: constraints.maxWidth > 700 ? tex_sty2 : tex_sty,
                      ),
                      NumberPicker(
                          selectedTextStyle: TextStyle(
                              fontSize: constraints.maxWidth > 700 ? 35 : 20,
                              color: prime_color),
                          minValue: 5,
                          maxValue: 50,
                          step: 5,
                          value: selectedNumberOfWords,
                          onChanged: (value) => setState(() {
                                selectedNumberOfWords = value;
                              })),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Select Number Of Seconds:',
                        style: constraints.maxWidth > 700 ? tex_sty2 : tex_sty,
                      ),
                      NumberPicker(
                          selectedTextStyle: TextStyle(
                              fontSize: constraints.maxWidth > 700 ? 35 : 20,
                              color: prime_color),
                          minValue: 5,
                          maxValue: 100,
                          step: 5,
                          value: selectedNumberOfSeconds,
                          onChanged: (value) => setState(() {
                                selectedNumberOfSeconds = value;
                              })),
                    ]),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        );
      }),
      floatingActionButton: LayoutBuilder(builder: (context, constraints) {
        return Container(
          margin: EdgeInsets.all(10),
          height: constraints.maxWidth > 700 ? 100 : 60,
          width: constraints.maxWidth > 700 ? 120 : 60,
          child: FittedBox(
            child: FloatingActionButton(
                backgroundColor: onPrime_color,
                child: Text(
                  'Start',
                  style: constraints.maxWidth > 700 ? butn_style : butn_style2,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(
                          listWords: listOfWords(selectedNmberOfLetters),
                          selectedNum: selectedNumberOfWords,
                          selectedSecond: selectedNumberOfSeconds,
                        ),
                      ));
                  print(selectedNumberOfWords);
                }),
          ),
        );
      }),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}

/*class BasicJson {
  final int id;
  final String title;

  const BasicJson({
    required this.id,
    required this.title,
  });

  BasicJson.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}*/

class WordsModel {
  final String name;
  final int length;
  // ignore: non_constant_identifier_names
  final List<String> words_sample;

  WordsModel(this.name, this.length, this.words_sample);

  WordsModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        length = json['length'],
        words_sample = List<String>.from(json["words_sample"].map((x) => x));

  Map<String, dynamic> toJson() => {
        'name': name,
        'length': length,
        'words_sample': words_sample,
      };
}
