import 'package:flutter/material.dart';
import 'package:leftright/Wigets/dogimage.dart';
import 'package:leftright/Wigets/jokepage.dart';
import 'package:leftright/Wigets/loading.dart';
import 'package:leftright/model/dogmodel.dart';
import 'package:leftright/model/providermodel.dart';
import 'package:leftright/model/sharemodel.dart';
import 'package:provider/provider.dart';
import '../model/jokomodel.dart';

class OutputPage extends StatefulWidget {
  const OutputPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OutputPage> createState() => OutputPageState();
}

class OutputPageState extends State<OutputPage> {
  final List<Widget> pages = [
    const JokePage(),
    const DogPicture(),
    const Loading(),
  ];

  @override
  Widget build(BuildContext context) {
    ModelShare ms = ModelShare();
    final int index =
        Provider.of<GetWidget>(context, listen: true).currentWidget;
    Widget out = pages[index];
    var jokemsg = Provider.of<GetWidget>(context, listen: true).Joke.toString();
    var linkmsg = Provider.of<GetWidget>(context, listen: true).Link.toString();

    return Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(child: out),
              ),
            ),
            Positioned(
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () async {
                    if (index == 0) {
                      Provider.of<GetWidget>(context, listen: false)
                          .changeSelectedWidget(2);
                      await getJoke(context);
                      Provider.of<GetWidget>(context, listen: false)
                          .changeSelectedWidget(0);
                    } else {
                      Provider.of<GetWidget>(context, listen: false)
                          .changeSelectedWidget(2);
                      await getJoke(context);
                      Provider.of<GetWidget>(context, listen: false)
                          .changeSelectedWidget(0);
                    }
                  },
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () async {
                    if (index == 1) {
                      Provider.of<GetWidget>(context, listen: false)
                          .changeSelectedWidget(2);
                      await getDog(context);
                      Provider.of<GetWidget>(context, listen: false)
                          .changeSelectedWidget(1);
                    } else {
                      Provider.of<GetWidget>(context, listen: false)
                          .changeSelectedWidget(2);
                      await getDog(context);
                      Provider.of<GetWidget>(context, listen: false)
                          .changeSelectedWidget(1);
                    }
                  },
                ),
              ),
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                Provider.of<GetWidget>(context, listen: false)
                    .changeSelectedIndex(0);
                Provider.of<GetWidget>(context, listen: false).updatLink('');
                Provider.of<GetWidget>(context, listen: false).updateJoke('');
              },
              child: const Icon(Icons.home),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            FloatingActionButton(
              onPressed: () {
                if (index == 0) {
                  ms.onShare(context, jokemsg);
                } else {
                  ms.onShare(context, linkmsg);
                }
              },
              child: const Icon(Icons.share),
            ),
          ],
        ));
  }
}
