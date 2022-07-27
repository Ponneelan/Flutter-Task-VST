import 'package:flutter/material.dart';

import 'mainwidget.dart';

Widget customwidget = first();

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Left-Right'),
      ),
      body: customwidget,
    ));
  }
}
