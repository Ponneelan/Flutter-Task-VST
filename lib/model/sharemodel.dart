import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ModelShare {
  void onShare(BuildContext ctx, String value) async {
    final box = ctx.findRenderObject() as RenderBox?;
    await Share.share(
      value,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}
