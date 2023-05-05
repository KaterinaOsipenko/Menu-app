import 'package:flutter/material.dart';

import 'package:menu_app/models/meal.dart';
import 'package:menu_app/widgets/meals/meals_veiw_widget.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;
  const MealsScreen({super.key, required this.title, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: MealsViewWidget(
        meals: meals,
      ),
    );
  }
}
