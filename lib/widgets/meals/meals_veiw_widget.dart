import 'package:flutter/material.dart';
import 'package:menu_app/utils/constants.dart';

import 'package:menu_app/widgets/meals/meal_item_widget.dart';
import 'package:menu_app/models/meal.dart';

class MealsViewWidget extends StatelessWidget {
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavourite;
  const MealsViewWidget(
      {super.key, required this.meals, required this.onToggleFavourite});

  @override
  Widget build(BuildContext context) {
    return meals.isEmpty
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  nothingHereMsg,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  trySelectAnotherCategoryMsg,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return MealItemWidget(
                  meal: meals[index], onToggleFavourite: onToggleFavourite);
            },
            itemCount: meals.length,
          );
  }
}
