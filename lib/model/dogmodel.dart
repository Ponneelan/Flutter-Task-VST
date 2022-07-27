import 'package:dio/dio.dart';

import 'dart:convert';

class DogModel {
  final String DogImageLink;
  DogModel({required this.DogImageLink});

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(DogImageLink: json['message']);
  }
}

var dio = Dio();

Future<DogModel> getDog() async {
  var response = await dio.get('https://dog.ceo/api/breeds/image/random');
  if (response.statusCode == 200) {
    return DogModel.fromJson(json.decode(response.toString()));
  } else {
    throw Exception('Bad request');
  }
}
