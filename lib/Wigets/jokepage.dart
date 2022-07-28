import 'package:flutter/material.dart';
import 'package:leftright/model/jokomodel.dart';
import 'package:leftright/model/providermodel.dart';
import 'package:leftright/model/sharemodel.dart';
import 'package:provider/provider.dart';

class JokePage extends StatefulWidget {
  const JokePage({Key? key}) : super(key: key);

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  ModelShare ms = ModelShare();
  late Future<JokeModel> futureJoke;
  @override
  void initState() {
    super.initState();
    futureJoke = getJoke();
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //const Padding(padding: EdgeInsets.all()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Center(
                        child: Text(
                      snapshot.data!.randomJoke.toString(),
                      style: const TextStyle(fontSize: 25),
                    )),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ms.onShare(
                            context, snapshot.data!.randomJoke.toString());
                      },
                      child: const Text('Sent'))
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<GetWidget>(context, listen: false).changeSelectedIndex(0);
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
