// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'dart:convert';
//import 'dart:ffi';

import 'package:dictation_words/model_words.dart';
import 'package:dictation_words/wordsList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//sdk: ">=2.17.0-125.0.dev <3.0.0"
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> words = [];
  int word_length = 0;
  List<String> wordsSelectedLength = [];
  final TextEditingController _controller = TextEditingController();
  Future<void> readFromJson() async {
    final String response = await rootBundle.loadString('assets/words.json');
    var data = await json.decode(response);
    //  words=
    // words = data["words"];
    words = data;
    var examples =
        words.map<WordsModel>((json) => WordsModel.fromJson(json)).toList();
    print('$examples' + 'this is my example list');
    setState(() {
      // words = data["words"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFromJson();
    // print("From json: " + words.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "please enter length"),
                onChanged: (value) {
                  word_length = int.parse(value);
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    wordsSelectedLength = [];
                    for (int i = 0; i < words.length; i++) {
                      if (word_length == int.parse(words[i]['length'])) {
                        // print(words[i]['words_example'][ii].toString());
                        // List<String> w = words[i]['words_example'] as List<String>;
                        var myList =
                            new List<String>.from(words[i]['words_example']);
                        for (int ii = 0; ii < myList.length; ii++) {
                          // print(myList.length.toString());
                          wordsSelectedLength.add(myList[ii].toString());
                        }
                        // wordsSelectedLength.add("mew1");
                        // wordsSelectedLength.add("mew2");
                      }
                    }
                    // print(words);
                    //print(wordsSelectedLength);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WordsList(
                                wordsSelectedLength: wordsSelectedLength)));
                  },
                  child: Text('Click')),
            ],
          )),
    );
  }
}
