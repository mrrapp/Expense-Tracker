import 'package:flutter/material.dart';
import 'package:my_expenses/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);
var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.onPrimaryContainer,
          foregroundColor: kDarkColorScheme.primaryContainer,
          // actionsIconTheme: const IconThemeData().copyWith(
          //   color: kColorScheme.onSecondary,
          // ),
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 8,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: TextStyle(
            fontSize: 18,
            color: kDarkColorScheme.secondary,
          ),
          bodyMedium: const TextStyle(
            color: Colors.black,
          ),
          bodySmall: const TextStyle(
            color: Colors.black,
          ),
          titleMedium: TextStyle(color: kDarkColorScheme.onPrimary),
          displaySmall: const TextStyle(
            color: Colors.black,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.secondaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
          //color: Colors.white,
          actionsIconTheme: const IconThemeData().copyWith(
            color: kColorScheme.primaryContainer,
          ),
        ),
       iconTheme: const IconThemeData().copyWith(color:kColorScheme.onSecondaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.secondaryContainer,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: TextStyle(
            fontSize: 18,
            color: kColorScheme.onSecondaryContainer,
          ),
          bodyMedium: const TextStyle(color: Colors.black),
          titleMedium: const TextStyle(color: Colors.black),
          // displayMedium:  const TextStyle(color: Colors.red),
          // headlineMedium: const TextStyle(color: Colors.red),
          // titleSmall: const TextStyle(color: Colors.red),
          // headlineSmall: const TextStyle(color: Colors.red),
          // labelMedium: const TextStyle(color: Colors.red),
          // labelSmall:const TextStyle(color: Colors.red),
          bodySmall: const TextStyle(
            color: Colors.black,
          ),
          displaySmall: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
