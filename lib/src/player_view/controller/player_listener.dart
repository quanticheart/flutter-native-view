import 'dart:developer';

import 'package:native_view/src/player_view/controller/player_methods.dart';

class PlayerListener extends PlayerMethods {
  Future listenerPlayerEvents() async {
    eventSubscription =
        listenerChannel.receiveBroadcastStream().listen((event) async {
      switch (event['PlayerEvent']) {
        case "isPlaying":
          currentTime.value = int.tryParse(event["currentTime"]) ?? 10;
          log("afdasfafs");
          break;
        case "isReady":
          duration.value = int.tryParse(event["duration"]) ?? 10;

          break;
        default:
      }
    });
  }
}
