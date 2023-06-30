import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_app/data/dummy_data.dart';
import 'package:menu_app/models/category.dart';
import 'package:menu_app/screens/home/new_category.dart';
import 'package:menu_app/utils/constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
        title: const Text(categoriesPageTitle),
        actions: [
          IconButton(
            onPressed: _openAddNewCategory,
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: CategoryViewWidget(
          availableCategoriesList: availableCategories,
        ),
      ),
    );
  }
}
