import 'package:flutter/material.dart';
import 'package:leftright/model/dogmodel.dart';
import 'package:leftright/model/jokomodel.dart';
import 'package:leftright/model/providermodel.dart';
import 'package:provider/provider.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
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
          onTap: () async {
            await getJoke(context);
            Provider.of<GetWidget>(context, listen: false)
                .changeSelectedWidget(0);
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
          onTap: () async {
            await getDog(context);

            Provider.of<GetWidget>(context, listen: false)
                .changeSelectedWidget(1);
            Provider.of<GetWidget>(context, listen: false)
                .changeSelectedIndex(1);
          },
        )),
      ],
    );
  }
}
