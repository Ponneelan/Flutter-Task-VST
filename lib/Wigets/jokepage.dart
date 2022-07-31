import 'package:flutter/material.dart';
import 'package:leftright/model/jokomodel.dart';
import 'package:leftright/model/providermodel.dart';
import 'package:leftright/model/sharemodel.dart';
import 'package:leftright/Screens/outputpage.dart';
import 'package:provider/provider.dart';

class JokePage extends StatefulWidget {
  const JokePage({Key? key}) : super(key: key);
  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  // var jokeFuture = FutureBuilder<JokeModel>(
  //   future: getJoke(),
  //   builder: ((context, snapshot) {
  //     if (snapshot.hasData) {
  //       return Text(snapshot.data!.randomJoke.toString());
  //     } else if (snapshot.hasError) {
  //       return const Text('Error');
  //     } else {
  //       return const CircularProgressIndicator();
  //     }
  //   }),
  // );
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<GetWidget>(context, listen: true).Joke.toString());
  }
}
