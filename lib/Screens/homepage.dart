import 'package:flutter/material.dart';
import 'package:leftright/Screens/mainwidget.dart';
import 'package:leftright/Wigets/dogimage.dart';
import 'package:leftright/Wigets/jokepage.dart';
import 'package:leftright/model/providermodel.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Widget> _pages = [
    const FirstWidget(),
    const JokePage(),
    const DogPicture()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Left-Right'),
            ),
            body: _pages[
                Provider.of<GetWidget>(context, listen: true).currentIndex]));
  }
}
