import 'package:flutter/material.dart';

class MealFeature extends StatelessWidget {
  final bool flag;
  final String msg;
  const MealFeature({super.key, required this.msg, required this.flag});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          msg,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Theme.of(context).colorScheme.background),
        ),
        flag ? const Icon(Icons.check) : const Icon(Icons.close),
      ],
    );
  }
}
