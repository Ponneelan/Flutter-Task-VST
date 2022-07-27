import 'package:flutter/material.dart';
import 'package:leftright/model/jokomodel.dart';
import 'package:share/share.dart';

class JokePage extends StatefulWidget {
  JokePage({Key? key}) : super(key: key);

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  late Future<JokeModel> futureJoke;
  @override
  void initState() {
    super.initState();
    futureJoke = getJoke();
  }

  _onShare(BuildContext context, String JokeText) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    await Share.share(JokeText,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<JokeModel>(
          future: futureJoke,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(snapshot.data!.RandomJoke),
                    const SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _onShare(context, snapshot.data!.RandomJoke);
                        },
                        child: const Text('Sent'))
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const Text("error");
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.pop(context);
        }));
  }
}
