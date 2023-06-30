import 'package:flutter/material.dart';
import 'package:menu_app/models/meal.dart';
import 'package:menu_app/widgets/meals/meal_ingridients.dart';
import 'package:menu_app/widgets/meals/meal_steps.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItemDetailScreen extends StatefulWidget {
  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;
  const MealItemDetailScreen(
      {super.key, required this.meal, required this.onToggleFavourite});

  @override
  State<MealItemDetailScreen> createState() => _MealItemDetailScreenState();
}

class _MealItemDetailScreenState extends State<MealItemDetailScreen> {
  void onToggleFav() {
    setState(() {
      widget.meal.isFavourite
          ? widget.meal.isFavourite = false
          : widget.meal.isFavourite = true;
    });
    widget.onToggleFavourite(widget.meal);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            onPressed: onToggleFav,
            icon: widget.meal.isFavourite
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border_outlined),
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: widget.meal.imageUrl,
              fit: BoxFit.cover,
              height: mediaQuery.size.height / 3,
              width: double.infinity,
            ),
            MealIngridients(meal: widget.meal),
            MealSteps(meal: widget.meal),
          ],
        ),
      )),
    );
  }
}
