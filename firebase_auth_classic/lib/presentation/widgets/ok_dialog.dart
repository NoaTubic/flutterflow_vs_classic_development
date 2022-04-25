import 'package:firebase_auth_classic/presentation/strings/strings.dart';
import 'package:flutter/cupertino.dart';

void showOkDialog({
  required BuildContext context,
  required String title,
  required String content,
  void Function()? onPressed,
}) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          CupertinoDialogAction(
              child: const Text(AppStrings.ok), onPressed: onPressed)
        ],
      );
    },
  );
}
