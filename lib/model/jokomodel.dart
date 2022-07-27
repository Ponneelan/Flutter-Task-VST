import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:chopper/chopper.dart';
part 'chopper_api_service.chopper.dart';

class JokeModel {
  final String RandomJoke;
  JokeModel({required this.RandomJoke});
  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(RandomJoke: json['value']);
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

// @ChopperApi(baseUrl: 'https://api.chucknorris.io/jokes/random')
// abstract class ChopperApiService extends ChopperService {
//   @Get(path: '')
//   Future<Response> getNews({
//     @Query('apiKey') String apiKey = 'secret',
//   });

//   static ChopperApiService create() {
//     final client = ChopperClient(
//       baseUrl: 'https://newsapi.org/v2',
//       services: [
//         _$ChopperApiService(),
//       ],
//       converter: JsonConverter(),
//     );
//     return _$ChopperApiService(client);
//   }
// }
