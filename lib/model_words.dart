import 'dart:convert';

class WordsModel {
  late int length;
  // ignore: non_constant_identifier_names
  late List<String> words_example;

  WordsModel(this.length, this.words_example);

  WordsModel.fromJson(Map<String, dynamic> json)
      : length = json["length"],
        // words_example = json["words_example"];
        words_example = List<String>.from(json["words_example"].map((e) => e));

  Map<String, dynamic> toJson() => {
        'length': length,
        'words_example': words_example,
      };
}
