import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'android_view.dart';
import 'ios_view.dart';

class PlayerView extends StatelessWidget {
  final String androidUrl;
  final String iosUrl;

  const PlayerView({Key? key, required this.androidUrl, required this.iosUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: GetPlatform.isAndroid
            ? AndroidViewFlutter(url: androidUrl)
            : IosView(url: iosUrl),
      ),
    );
  }
}
