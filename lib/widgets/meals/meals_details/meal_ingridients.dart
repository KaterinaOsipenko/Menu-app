import 'package:flutter/material.dart';
import 'package:menu_app/models/meal.dart';
import 'package:menu_app/utils/constants.dart';

class MealIngridients extends StatelessWidget {
  final Meal meal;
  const MealIngridients({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: mediaQuery.size.height * 0.015,
          ),
          child: Text(
            ingridientsText,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
          ),
        ),
        for (var ingridient in meal.ingredients)
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: mediaQuery.size.height * 0.005),
            child: Text(
              ingridient,
              style: Theme.of(context).textTheme.titleMedium!,
            ),
          ),
      ],
    );
  }
}
