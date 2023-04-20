import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_app/data/dummy_data.dart';
import 'package:menu_app/models/category.dart';
import 'package:menu_app/models/icons_card.dart';
import 'package:menu_app/widgets/home/card_icon_item.dart';
import 'package:menu_app/screens/home/new_category.dart';
import 'package:menu_app/widgets/home/category_view.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  void _addCategory(Category category) {
    setState(() {
      availableCategories.add(category);
    });
  }

  void _openAddNewCategory() {
    final height = MediaQuery.of(context).size.height;
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text(
            "Create a new Category",
          ),
          contentPadding: EdgeInsets.fromLTRB(
              height * 0.03, height * 0.03, height * 0.03, height * 0.05),
          children: [
            NewCategoryScreen(onAddCategory: _addCategory),
          ],
        );
      },
    );
  }

  PreferredSizeWidget _buildIOSAppbar() {
    return CupertinoNavigationBar(
      leading: const Text("Menu App"),
      trailing: IconButton(
          onPressed: _openAddNewCategory, icon: const Icon(Icons.add_outlined)),
    );
  }

  PreferredSizeWidget _buildAndriodAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      elevation: 0,
      title: const Text("Menu App"),
      actions: [
        IconButton(
          onPressed: _openAddNewCategory,
          icon: const Icon(Icons.add_outlined),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar =
        Platform.isAndroid ? _buildAndriodAppBar() : _buildIOSAppbar();
    final mediaQuery = MediaQuery.of(context);
    final contentHeight = (mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top);
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(1),
                    Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (var card in IconsCard.values)
                        CardIconItemWidget(
                          title: card.title,
                          icon: card.icon,
                        )
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(bottom: 30, top: 30, left: 20),
                    child: Text(
                      'Pick up a category!',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              decorationThickness: 3,
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      "menu app - menu app - menu app - menu app - menu app - menu app - menu app - menu app - menu app -",
                      softWrap: false,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                  CategoryViewWidget(
                    availableCategoriesList: availableCategories,
                    height: contentHeight,
                    width: mediaQuery.size.width,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
