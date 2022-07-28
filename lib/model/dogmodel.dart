import 'package:dio/dio.dart';

import 'dart:convert';

class DogModel {
  final String dogImageLink;
  DogModel({required this.dogImageLink});

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(dogImageLink: json['message']);
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
