import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:leftright/model/dogmodel.dart';
import 'package:leftright/model/providerModel.dart';
import 'package:leftright/model/sharemodel.dart';
import 'package:provider/provider.dart';

class DogPicture extends StatefulWidget {
  const DogPicture({Key? key}) : super(key: key);

  @override
  State<DogPicture> createState() => _DogPictureState();
}

class _DogPictureState extends State<DogPicture> {
  ModelShare ms = ModelShare();
  late Future<DogModel> futureDogImage;
  @override
  void initState() {
    super.initState();
    futureDogImage = getDog();
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
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Image.network(
                        snapshot.data!.dogImageLink,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () => ms.onShare(
                            context, snapshot.data!.dogImageLink.toString()),
                        child: const Text('Sent'))
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<GetWidget>(context, listen: false)
            .changeSelectedIndex(0),
        child: const Icon(Icons.home),
      ),
    );
  }
}
