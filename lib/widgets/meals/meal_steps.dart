import 'package:flutter/material.dart';
import 'package:menu_app/models/meal.dart';
import 'package:menu_app/utils/constants.dart';

class MealSteps extends StatelessWidget {
  final Meal meal;
  const MealSteps({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: mediaQuery.size.height * 0.02,
            bottom: mediaQuery.size.height * 0.01,
          ),
          child: Text(
            stepsText,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        for (int i = 0; i < meal.steps.length; i++)
          Container(
            margin: EdgeInsets.symmetric(
                vertical: mediaQuery.size.height * 0.01,
                horizontal: mediaQuery.size.width * 0.01),
            child: Text(
              '${i + 1})  ${meal.steps[i]}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!,
            ),
          ),
      ],
    );
  }
}
