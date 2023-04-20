import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveAlertDialog extends StatelessWidget {
  final String title;
  late Widget content;
  final List<Widget> actions;
  AdaptiveAlertDialog(
    this.title,
    this.content,
    this.actions, {
    super.key,
  });

  AdaptiveAlertDialog.namedConstructor(this.title, this.actions,
      [this.content = const SizedBox()]);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        content: content,
        actions: actions,
      );
    } else {
      return AlertDialog(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        content: content,
        actions: actions,
      );
    }
  }
}
