// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class WordsList extends StatelessWidget {
  WordsList({Key? key, required this.wordsSelectedLength}) : super(key: key);
  List<String> wordsSelectedLength = <String>[];
  // final List<String> names = <String>[
  //   'Manish',
  //   'Jitender',
  //   'Pankaj',
  //   'Aarti',
  //   'Nighat',
  //   'Mohit',
  //   'Ruchika',
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WordsList')),
      body: ListView.builder(
          itemCount: wordsSelectedLength.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              margin: EdgeInsets.all(2),
              child: ListTile(
                  leading: Text('${wordsSelectedLength[index]}'),
                  title: Text("List item $index")),
            );
          }),
    );
  }
}
