import 'package:flutter/material.dart';
import 'package:leftright/model/providermodel.dart';
import 'package:provider/provider.dart';

class DogPicture extends StatefulWidget {
  const DogPicture({Key? key}) : super(key: key);

  @override
  State<DogPicture> createState() => _DogPictureState();
}

class _DogPictureState extends State<DogPicture> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width / 1.8,
      child: Image.network(
        Provider.of<GetWidget>(context, listen: true).Link.toString(),
        fit: BoxFit.fill,
      ),
    );
  }
}
