import 'package:flutter/material.dart';
import 'package:menu_app/models/meal.dart';
import 'package:menu_app/widgets/meals/meal_ingridients.dart';
import 'package:menu_app/widgets/meals/meal_steps.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItemDetailScreen extends StatelessWidget {
  final Meal meal;
  const MealItemDetailScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: meal.imageUrl,
              fit: BoxFit.cover,
              height: mediaQuery.size.height / 3,
              width: double.infinity,
            ),
            MealIngridients(meal: meal),
            MealSteps(meal: meal),
          ],
        ),
      )),
    );
  }
}
