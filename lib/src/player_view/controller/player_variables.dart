import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../constants/constants.dart';

class PlayerVariables extends GetxController {
  final methodChannel = const MethodChannel(playerMethodChannelTag);
  final listenerChannel = const EventChannel(playerListenerChannelTag);
  StreamSubscription? eventSubscription;
  RxBool isPlaying = false.obs;
  RxInt currentTime = 0.obs;
  RxInt duration = 0.obs;
}
