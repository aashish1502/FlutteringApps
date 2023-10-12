import 'package:flutter/material.dart';
import 'package:priceless_habits/widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 205, 155, 255));

var kColorSchemeDarkMode =
    ColorScheme.fromSeed(brightness: Brightness.dark,  seedColor: const Color.fromARGB(255, 5, 99, 125));

void main() {
  runApp(
    MaterialApp(
        home: const Expenses(),
        themeMode: ThemeMode.system,
        darkTheme: ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: kColorSchemeDarkMode,
            cardTheme: const CardTheme().copyWith(
              color: kColorSchemeDarkMode.secondaryContainer,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8))),
        theme: ThemeData().copyWith(
            useMaterial3: true,
            colorScheme: kColorScheme,
            appBarTheme: const AppBarTheme().copyWith(
                backgroundColor: kColorScheme.onPrimaryContainer,
                foregroundColor: kColorScheme.primaryContainer),
            cardTheme: const CardTheme().copyWith(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8)),
            textTheme: ThemeData().textTheme.copyWith())),
  );
}
