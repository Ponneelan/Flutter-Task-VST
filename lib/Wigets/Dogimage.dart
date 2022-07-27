import 'package:flutter/material.dart';
import 'package:leftright/model/dogmodel.dart';
import 'package:share/share.dart';

class DogPicture extends StatefulWidget {
  DogPicture({Key? key}) : super(key: key);

  @override
  State<DogPicture> createState() => _DogPictureState();
}

class _DogPictureState extends State<DogPicture> {
  late Future<DogModel> futureDogImage;
  @override
  void initState() {
    super.initState();
    futureDogImage = getDog();
  }

  _onShare(BuildContext context, String JokeText) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    await Share.share(JokeText,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DogModel>(
          future: futureDogImage,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 500,
                      width: 500,
                      child: Image.network(snapshot.data!.DogImageLink),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () => _onShare(
                            context, snapshot.data!.DogImageLink.toString()),
                        child: const Text('Sent'))
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const Text('error');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pop(context);
      }),
    );
  }
}
