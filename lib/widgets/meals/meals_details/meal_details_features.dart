import 'package:flutter/material.dart';
import 'package:menu_app/models/meal.dart';
import 'package:menu_app/utils/constants.dart';
import 'package:menu_app/widgets/meals/meals_details/meal_feature.dart';

class MealDetailsFeatures extends StatelessWidget {
  final Meal meal;
  const MealDetailsFeatures({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: mediaQuerySize.height * 0.03,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: mediaQuerySize.width * 0.04,
        vertical: mediaQuerySize.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MealFeature(msg: vegetarianMsg, flag: meal.isVegetarian),
          MealFeature(msg: veganMsg, flag: meal.isVegan),
          MealFeature(msg: glutenFreeMsg, flag: meal.isGlutenFree),
          MealFeature(msg: lactoseFreeMsg, flag: meal.isLactoseFree),
        ],
      ),
    );
  }
}
