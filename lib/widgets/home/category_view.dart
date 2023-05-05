import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:menu_app/models/category.dart';
import 'package:menu_app/screens/meals_screen.dart';
import 'package:menu_app/widgets/home/category_grid_item.dart';

class CategoryViewWidget extends StatelessWidget {
  final List<Category> availableCategoriesList;
  final double height;
  final double width;

  const CategoryViewWidget(
      {super.key,
      required this.availableCategoriesList,
      required this.height,
      required this.width});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const MealsScreen(title: 'Some Category', meals: []),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.6,
      width: width,
      child: MasonryGridView.builder(
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: availableCategoriesList.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            category: availableCategoriesList[index],
            height: (Random().nextInt(10) % 7) * 60,
            onSelected: () {
              _selectCategory(context);
            },
          );
        },
      ),
    );
  }
}
