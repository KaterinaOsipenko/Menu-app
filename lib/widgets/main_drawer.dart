import 'package:flutter/material.dart';
import 'package:menu_app/utils/constants.dart';

class MainDrawer extends StatelessWidget {
  final Function onSelectedScreen;
  const MainDrawer({super.key, required this.onSelectedScreen});

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.sizeOf(context);
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 5,
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(mediaQuerySize.height * 0.01),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 35,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(
                  width: mediaQuerySize.width * 0.02,
                ),
                Text(
                  cookingUpMsg,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 25,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              filtersMsg,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              onSelectedScreen(filtersMsg);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 25,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              mealsMsg,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              onSelectedScreen(mealsMsg);
            },
          ),
        ],
      ),
    );
  }
}
