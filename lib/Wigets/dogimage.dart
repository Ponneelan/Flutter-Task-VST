import 'package:flutter/material.dart';
import 'package:leftright/model/dogmodel.dart';
import 'package:leftright/model/providermodel.dart';
import 'package:leftright/model/sharemodel.dart';
import 'package:provider/provider.dart';

class DogPicture extends StatefulWidget {
  const DogPicture({Key? key}) : super(key: key);

  @override
  State<DogPicture> createState() => _DogPictureState();
}

class _DogPictureState extends State<DogPicture> {
  // var dogFuture = FutureBuilder<DogModel>(
  //     future: getDog(),
  //     builder: ((context, snapshot) {
  //       if (snapshot.hasData) {
  //         return Image.network(
  //           snapshot.data!.dogImageLink.toString(),
  //           height: MediaQuery.of(context).size.height / 2,
  //           width: MediaQuery.of(context).size.width / 2,
  //           fit: BoxFit.fill,
  //         );
  //       } else if (snapshot.hasError) {
  //         return const Text('Error');
  //       } else {
  //         return const CircularProgressIndicator();
  //       }
  //     }));
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width / 1.3,
      child: Image.network(
        Provider.of<GetWidget>(context, listen: true).Link.toString(),
        fit: BoxFit.fill,
      ),
    );
  }
}
