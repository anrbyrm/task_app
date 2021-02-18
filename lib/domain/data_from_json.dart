import 'dart:async';

import 'package:http/http.dart' as http;

import 'model.dart';

class DataFromJson {
  static const String baseURL =
      'https://cdn.fonibo.com/challenges/tasks.json?fbclid='
      'IwAR2M9683ug0qQz4jocPsWV3lRXQy2zrwiTsDCKS1WhCnIzGeKXPKjgvy6tg';

  static Future<List<Model>> fetchData() async {
    try {
      final response = await http.get(baseURL);

      if (response.statusCode == 200) {
        final List<Model> listItems = modelFromJson(response.body);
        return listItems;
      } else {
        throw Exception('Fail');
      }
    } catch (e) {
      throw Exception('Failed $e');
    }
  }
}
