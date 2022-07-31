import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:leftright/model/providermodel.dart';
import 'package:provider/provider.dart';

class JokeModel {
  final String randomJoke;
  JokeModel({required this.randomJoke});
  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(randomJoke: json['value']);
  }
}

var dio = Dio();
Future<JokeModel> getJoke(BuildContext ctx) async {
  var res = await dio.get("https://api.chucknorris.io/jokes/random");
  if (res.statusCode == 200) {
    var result = JokeModel.fromJson(json.decode(res.toString()));
    Provider.of<GetWidget>(ctx, listen: false)
        .updateJoke(result.randomJoke.toString());
    return result;
  } else {
    throw Exception("Bad Request");
  }
}
