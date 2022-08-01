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
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<GetWidget>(context, listen: true).Joke.toString());
  }
}
