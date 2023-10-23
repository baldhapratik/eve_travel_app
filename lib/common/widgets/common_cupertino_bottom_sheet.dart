import 'package:eve_travel_app/app_imports/app_imports.dart';
import 'package:flutter/cupertino.dart';

void showCupertinoModalBottomSheet(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        title: const Text('Sort By'),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: const Text('Response Time'),
            onPressed: () {
              Get.back();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Alphabetical'),
            onPressed: () {
              Get.back();
            },
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
      );
    },
  );
}
