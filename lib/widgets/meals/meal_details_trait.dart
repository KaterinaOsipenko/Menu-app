import 'package:flutter/material.dart';
import 'package:menu_app/models/meal.dart';
import 'package:menu_app/utils/constants.dart';

class MealDetailsTrait extends StatelessWidget {
  final Meal meal;
  const MealDetailsTrait({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$durationMsg : ${meal.duration} min',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          '$affordabilityMsg : ${meal.affordability.name} ',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          '$complexityMsg : ${meal.complexity.name} ',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
