import 'package:flutter/material.dart';
import 'package:menu_app/data/dummy_meal.dart';
import 'package:menu_app/models/meal.dart';
import 'package:menu_app/utils/constants.dart';
import 'package:menu_app/widgets/home/category_grid_item.dart';
import 'package:menu_app/models/category.dart';
import 'package:menu_app/screens/meal/meals_screen.dart';

class CategoryViewWidget extends StatelessWidget {
  final List<Category> availableCategoriesList;
  final void Function(Meal meal) onToggleFavourite;

  const CategoryViewWidget({
    super.key,
    required this.availableCategoriesList,
    required this.onToggleFavourite,
  });

  void _selectCategory(BuildContext context, Category category) {
    final mealsByCategory = dummyMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
            title: category.title,
            meals: mealsByCategory,
            onToggleFavourite: onToggleFavourite),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.sizeOf(context);
    return Expanded(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: mediaQuerySize.height * 0.04),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.blueGrey,
                  blurRadius: 25,
                  spreadRadius: 15,
                ),
              ],
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: mediaQuerySize.height * 0.05,
              left: mediaQuerySize.width * 0.02,
              right: mediaQuerySize.width * 0.02,
            ),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: mediaQuerySize.height * 0.01),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3 / 2,
                    ),
                    itemCount: availableCategoriesList.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        category: availableCategoriesList[index],
                        onSelected: () {
                          _selectCategory(
                              context, availableCategoriesList[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
