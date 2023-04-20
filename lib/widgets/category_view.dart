import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:menu_app/models/category.dart';
import 'package:menu_app/widgets/category_grid_item.dart';

class CategoryViewWidget extends StatelessWidget {
  final List<Category> availableCategoriesList;
  final double height;
  final double width;

  const CategoryViewWidget(
      {super.key,
      required this.availableCategoriesList,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      radius: 20,
      splashColor: Theme.of(context).colorScheme.primary,
      child: SizedBox(
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
            );
          },
        ),
      ),
    );
  }
}
