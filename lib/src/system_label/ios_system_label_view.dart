import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_view/src/system_label/system_label_view.dart';

class IosSystemLabelView extends StatelessWidget {
  final Map<String, dynamic> args;

  const IosSystemLabelView({Key? key, required this.args})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return UiKitView(
      viewType: systemViewType,
      creationParamsCodec: const StandardMessageCodec(),
      creationParams: args,
      onPlatformViewCreated: (value) async {
        print("INIT IosSystemLabelView");
        print(args.toString());
      },
    );
  }
}

