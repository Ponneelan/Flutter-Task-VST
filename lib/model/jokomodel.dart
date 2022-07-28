import 'package:dio/dio.dart';
import 'dart:convert';

class JokeModel {
  final String randomJoke;
  JokeModel({required this.randomJoke});
  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(randomJoke: json['value']);
  }
}

var dio1 = Dio();

Future<JokeModel> getJoke() async {
  var res = await dio1.get("https://api.chucknorris.io/jokes/random");
  if (res.statusCode == 200) {
    return JokeModel.fromJson(json.decode(res.toString()));
  } else {
    throw Exception("Bad Request");
  }
}
