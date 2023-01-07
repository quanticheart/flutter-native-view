import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_view/src/system_label/android_system_label_view.dart';
import 'package:native_view/src/system_label/ios_system_label_view.dart';

const String systemViewType = 'systemViewTag';

class SystemLabelView extends StatefulWidget {
  final String text;

  const SystemLabelView({Key? key, required this.text}) : super(key: key);

  @override
  State<SystemLabelView> createState() => _SystemLabelViewState();
}

class _SystemLabelViewState extends State<SystemLabelView> {
  final Map<String, dynamic> creationParams = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    creationParams["text"] = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: SizedBox(
        height: 50,
        child: GetPlatform.isAndroid
            ? AndroidSystemLabelView(
                args: creationParams,
              )
            : IosSystemLabelView(
                args: creationParams,
              ),
      ),
    );
  }
}
