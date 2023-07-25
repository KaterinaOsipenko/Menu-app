import 'package:flutter/material.dart';
import 'package:menu_app/data/dummy_meal.dart';
import 'package:menu_app/models/filters.dart';
import 'package:menu_app/models/meal.dart';
import 'package:menu_app/screens/filters_screen.dart';
import 'package:menu_app/screens/home/categories.dart';
import 'package:menu_app/screens/meal/meals_screen.dart';
import 'package:menu_app/utils/constants.dart';
import 'package:menu_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegeterian: false,
  Filters.vegan: false
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int activeIndex = 0;
  List<Meal> favouriteMeal = [];
  Map<Filters, bool> selectedFilters = kInitialFilters;

  void onSelectedTab(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  void onToggleFavourite(Meal meal) {
    if (favouriteMeal.contains(meal)) {
      setState(() {
        favouriteMeal.remove(meal);
      });
    } else {
      favouriteMeal.add(meal);
    }
  }

  void setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == filtersMsg) {
      final result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(
            currentFilters: selectedFilters,
          ),
        ),
      );
      setState(() {
        selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = dummyMeals.where((meal) {
      if (selectedFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      if (selectedFilters[Filters.vegeterian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavourite: onToggleFavourite,
      meals: filteredMeals,
    );
    if (activeIndex == 1) {
      activePage = MealsScreen(
        title: favouritesPageTitle,
        meals: favouriteMeal,
        onToggleFavourite: onToggleFavourite,
      );
    }
    return Scaffold(
      drawer: MainDrawer(
        onSelectedScreen: setScreen,
      ),
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
