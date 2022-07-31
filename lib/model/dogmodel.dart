import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:leftright/model/providermodel.dart';
import 'package:provider/provider.dart';

import 'jokomodel.dart';

class DogModel {
  final String dogImageLink;
  DogModel({required this.dogImageLink});

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(dogImageLink: json['message']);
  }
}

var _res;
Future<DogModel> getDog(BuildContext ctx) async {
  var response = await dio.get('https://dog.ceo/api/breeds/image/random');
  if (response.statusCode == 200) {
    _res = DogModel.fromJson(json.decode(response.toString()));
    Provider.of<GetWidget>(ctx, listen: false)
        .updatLink(_res.dogImageLink.toString());
    return _res;
  } else {
    throw Exception('Bad request');
  }
}
