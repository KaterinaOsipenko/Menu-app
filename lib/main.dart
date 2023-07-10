import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/config/app_theme.dart';
import 'package:menu_app/screens/tab_screen.dart';
import 'screens/home/categories.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

final kColorDarkTheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 5, 99, 125),
    brightness: Brightness.dark);

final theme = ThemeData(
  shadowColor: Colors.black,
  colorScheme: kColorScheme,
  textTheme: GoogleFonts.latoTextTheme(),
);

final darkTheme = ThemeData(
  colorScheme: kColorDarkTheme,
  shadowColor: Colors.black,
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu App',
      theme: AppTheme.light,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const TabScreen(),
    );
  }
}
