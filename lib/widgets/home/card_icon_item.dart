import 'package:flutter/material.dart';

class CardIconItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const CardIconItemWidget(
      {super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shadowColor: Theme.of(context).shadowColor,
          elevation: 5,
          color: Theme.of(context).colorScheme.background,
          child: IconButton(
            onPressed: () {},
            icon: Icon(icon),
          ),
        ),
        Text(title),
      ],
    );
  }
}
