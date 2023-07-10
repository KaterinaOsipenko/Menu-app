import 'package:flutter/material.dart';
import 'package:menu_app/data/dummy_data.dart';
import 'package:menu_app/models/category.dart';
import 'package:menu_app/models/meal.dart';
import 'package:menu_app/screens/home/new_category.dart';
import 'package:menu_app/utils/constants.dart';
import 'package:menu_app/widgets/home/category_view.dart';
import 'package:menu_app/widgets/home/greeting.dart';

class CategoriesScreen extends StatefulWidget {
  final void Function(Meal meal) onToggleFavourite;
  const CategoriesScreen({super.key, required this.onToggleFavourite});

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
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Center(
          child: Text(
            categoriesPageTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _openAddNewCategory,
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Colors.white
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).height * 0.03,
                  bottom: MediaQuery.sizeOf(context).height * 0.01,
                ),
                child: const GreetingWidget(),
              ),
              CategoryViewWidget(
                availableCategoriesList: availableCategories,
                onToggleFavourite: widget.onToggleFavourite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
