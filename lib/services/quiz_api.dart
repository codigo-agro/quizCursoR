import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_01/model/question.dart';


class QuizApi {
  static Future<List<Question>> fetch() async {
    try {
      var url = 'https://script.google.com/macros/s/AKfycbyS2krap5zc8JbhxEqkq_XD8jjvgX_MbaUBGJ2t/exec';
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return List<Question>.from(
            data["questions"].map((x) => Question.fromMap(x)));
      } else {
        return List<Question>();
      }

    } catch (error) {
      print(error);
      return List<Question>();
    }
  }
}