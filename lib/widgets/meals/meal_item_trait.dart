import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  final String label;
  final IconData icon;
  const MealItemTrait({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.background,
              ),
        ),
      ],
    );
  }
}
