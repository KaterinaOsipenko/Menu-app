import 'package:flutter/material.dart';

import 'package:menu_app/models/meal.dart';

class MealItemWidget extends StatelessWidget {
  final Meal meal;
  const MealItemWidget({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.modulate,
          ),
          image: NetworkImage(meal.imageUrl),
        ),
      ),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      height: MediaQuery.of(context).size.height * 0.3,
      child: Center(
        child: Text(
          meal.title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).colorScheme.background,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
