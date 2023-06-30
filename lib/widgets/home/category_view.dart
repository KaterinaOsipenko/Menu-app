import 'package:flutter/material.dart';
import 'package:menu_app/data/dummy_meal.dart';
import 'package:menu_app/widgets/home/category_grid_item.dart';
import 'package:menu_app/models/category.dart';
import 'package:menu_app/screens/meal/meals_screen.dart';

class CategoryViewWidget extends StatelessWidget {
  final List<Category> availableCategoriesList;

  const CategoryViewWidget({
    super.key,
    required this.availableCategoriesList,
  });

  void _selectCategory(BuildContext context, Category category) {
    final mealsByCategory = dummyMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, meals: mealsByCategory),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return GridView.builder(
      padding: EdgeInsets.all(mediaQuery.size.height * 0.02),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      itemCount: availableCategoriesList.length,
      itemBuilder: (context, index) {
        return CategoryItem(
          category: availableCategoriesList[index],
          onSelected: () {
            _selectCategory(context, availableCategoriesList[index]);
          },
        );
      },
    );
  }
}
