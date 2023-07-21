import 'package:flutter/material.dart';
import 'package:menu_app/screens/tab_screen.dart';
import 'package:menu_app/utils/constants.dart';
import 'package:menu_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFreeSet = false;

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
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFreeSet,
              activeColor: Theme.of(context).colorScheme.primary,
              title: Text(
                glutenFreeFilterMsg,
              ),
              subtitle: Text(glutenFreeFilterSubMsg),
              onChanged: (isChecked) {
                setState(
                  () {
                    glutenFreeSet = isChecked;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
