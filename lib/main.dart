import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_view/src/player_view/constants/constants.dart';
import 'package:native_view/src/player_view/controller/player_controller.dart';
import 'package:native_view/src/player_view/ui/player_view.dart';
import 'package:native_view/src/system_label/system_label_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PlayerController controller = Get.put(PlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const PlayerView(
              androidUrl: androidUrl,
              iosUrl: iosUrl,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Obx(
                () => Text(
                  "${controller.currentTime}/${controller.duration}",
                ),
              ),
            ),
            const SystemLabelView(text: "Text From Flutter"),
          ],
        ),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          onPressed: () async => controller.isPlaying.value
              ? controller.pause()
              : controller.play(),
          tooltip: 'player',
          child: Icon(
            controller.isPlaying.value
                ? Icons.play_arrow
                : Icons.pause_circle_filled_outlined,
          ),
        ),
      ),
    );
  }
}
