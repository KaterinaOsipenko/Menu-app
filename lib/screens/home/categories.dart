import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_app/data/dummy_data.dart';
import 'package:menu_app/models/category.dart';
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

  Widget _buildAngroodBootomBar() {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Fav',
      ),
    ]);
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
      bottomNavigationBar: _buildAngroodBootomBar(),
      body: SafeArea(
        child: CategoryViewWidget(
          availableCategoriesList: availableCategories,
        ),
      ),
    );
  }
}
