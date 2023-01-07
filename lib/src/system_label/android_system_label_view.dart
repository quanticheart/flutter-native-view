import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_view/src/system_label/system_label_view.dart';

class AndroidSystemLabelView extends StatelessWidget {
  final Map<String, dynamic> args;

  const AndroidSystemLabelView({Key? key, required this.args})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AndroidView(
      viewType: systemViewType,
      creationParamsCodec: const StandardMessageCodec(),
      creationParams: args,
      onPlatformViewCreated: (value) async {
        print("INIT AndroidSystemLabelView");
        print(args.toString());
      },
    );
  }
}
