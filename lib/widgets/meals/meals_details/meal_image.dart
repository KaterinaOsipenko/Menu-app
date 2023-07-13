import 'package:flutter/material.dart';
import 'package:menu_app/models/meal.dart';

class MealImage extends StatelessWidget {
  final Meal meal;
  const MealImage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.sizeOf(context);
    return Container(
      height: mediaQuerySize.height / 2.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.modulate,
          ),
          image: NetworkImage(meal.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
