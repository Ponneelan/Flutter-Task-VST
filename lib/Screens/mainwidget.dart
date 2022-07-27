import 'package:flutter/material.dart';
import 'package:leftright/Wigets/Dogimage.dart';
import 'package:leftright/Wigets/Jokepage.dart';

class first extends StatefulWidget {
  first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: GestureDetector(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
            color: const Color.fromARGB(137, 167, 166, 166),
            child: const Center(
              child: Text(
                'Joke',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => JokePage()));
          },
        )),
        Expanded(
            child: GestureDetector(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
            color: Color.fromRGBO(255, 255, 255, 1),
            child: const Center(
              child: Text(
                'Dog',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DogPicture()));
          },
        )),
      ],
    );
  }
}
