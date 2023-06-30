import 'package:flutter/material.dart';
import 'package:menu_app/models/meal.dart';
import 'package:menu_app/screens/home/categories.dart';
import 'package:menu_app/screens/meal/meals_screen.dart';
import 'package:menu_app/utils/constants.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int activeIndex = 0;
  List<Meal> favouriteMeal = [];

  void onSelectedTab(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  void onToggleFavourite(Meal meal) {
    if (favouriteMeal.contains(meal)) {
      favouriteMeal.remove(meal);
    } else {
      favouriteMeal.add(meal);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFavourite: onToggleFavourite);
    if (activeIndex == 1) {
      activePage = MealsScreen(
          title: favouritesPageTitle,
          meals: favouriteMeal,
          onToggleFavourite: onToggleFavourite);
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 50,
        onTap: onSelectedTab,
        currentIndex: activeIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: categoriesPageTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: favouritesPageTitle,
          ),
        ],
      ),
      body: activePage,
    );
  }
}
