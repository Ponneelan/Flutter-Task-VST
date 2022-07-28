import 'package:flutter/material.dart';
import 'package:leftright/model/providerModel.dart';
import 'package:provider/provider.dart';

class FirstWidget extends StatefulWidget {
  const FirstWidget({Key? key}) : super(key: key);

  @override
  State<FirstWidget> createState() => _FirstWidgetState();
}

class _FirstWidgetState extends State<FirstWidget> {
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
            Provider.of<GetWidget>(context, listen: false)
                .changeSelectedIndex(1);
          },
        )),
        Expanded(
            child: GestureDetector(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: const Center(
              child: Text(
                'Dog',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
          ),
          onTap: () {
            Provider.of<GetWidget>(context, listen: false)
                .changeSelectedIndex(2);
          },
        )),
      ],
    );
  }
}
