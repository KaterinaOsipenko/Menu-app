import 'package:flutter/material.dart';

import 'package:menu_app/models/meal.dart';
import 'package:menu_app/widgets/meals/meals_veiw_widget.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavourite;
  const MealsScreen(
      {super.key,
      required this.title,
      required this.meals,
      required this.onToggleFavourite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: MealsViewWidget(meals: meals, onToggleFavourite: onToggleFavourite),
    );
  }
}
