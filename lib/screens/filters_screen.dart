import 'package:flutter/material.dart';
import 'package:menu_app/models/filters.dart';
import 'package:menu_app/screens/tab_screen.dart';
import 'package:menu_app/utils/constants.dart';
import 'package:menu_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filters, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFreeSet = false;
  var lactoseFreeSet = false;
  var veganFreeSet = false;
  var vegeterianFreeSet = false;

  @override
  void initState() {
    super.initState();
    glutenFreeSet = widget.currentFilters[Filters.glutenFree]!;
    lactoseFreeSet = widget.currentFilters[Filters.lactoseFree]!;
    veganFreeSet = widget.currentFilters[Filters.vegan]!;
    vegeterianFreeSet = widget.currentFilters[Filters.vegeterian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            filtersMsg,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop({
              Filters.glutenFree: glutenFreeSet,
              Filters.lactoseFree: lactoseFreeSet,
              Filters.vegan: veganFreeSet,
              Filters.vegeterian: vegeterianFreeSet,
            });
            return false;
          },
          child: Column(
            children: [
              SwitchListTile(
                value: glutenFreeSet,
                activeColor: Theme.of(context).colorScheme.primary,
                title: const Text(
                  glutenFreeFilterMsg,
                ),
                subtitle: const Text(glutenFreeFilterSubMsg),
                onChanged: (isChecked) {
                  setState(
                    () {
                      glutenFreeSet = isChecked;
                    },
                  );
                },
              ),
              SwitchListTile(
                value: lactoseFreeSet,
                activeColor: Theme.of(context).colorScheme.primary,
                title: const Text(
                  lactoseFreeFilterMsg,
                ),
                subtitle: const Text(lactoseFreeFilterSubMsg),
                onChanged: (isChecked) {
                  setState(
                    () {
                      lactoseFreeSet = isChecked;
                    },
                  );
                },
              ),
              SwitchListTile(
                value: veganFreeSet,
                activeColor: Theme.of(context).colorScheme.primary,
                title: const Text(
                  veganFilterMsg,
                ),
                subtitle: const Text(veganFilterSubMsg),
                onChanged: (isChecked) {
                  setState(
                    () {
                      veganFreeSet = isChecked;
                    },
                  );
                },
              ),
              SwitchListTile(
                value: vegeterianFreeSet,
                activeColor: Theme.of(context).colorScheme.primary,
                title: const Text(
                  vegetarianFilterMsg,
                ),
                subtitle: const Text(vegetarianFilterSubMsg),
                onChanged: (isChecked) {
                  setState(
                    () {
                      vegeterianFreeSet = isChecked;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
