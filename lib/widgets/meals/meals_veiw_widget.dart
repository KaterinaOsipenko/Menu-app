import 'package:flutter/material.dart';

import 'package:menu_app/widgets/meals/meal_item_widget.dart';
import 'package:menu_app/models/meal.dart';

class MealsViewWidget extends StatelessWidget {
  final List<Meal> meals;
  const MealsViewWidget({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return meals.isEmpty
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Uh oh ... nothing here!',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Try selecting a different category!',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return MealItemWidget(meal: meals[index]);
            },
            itemCount: meals.length,
          );
  }
}
