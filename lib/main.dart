import 'package:flutter/material.dart';

import 'package:mealapp/Activities/Loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        fontFamily: 'Agdasima',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 36,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontSize: 36,
            color: Theme.of(context).colorScheme.tertiary ,
          ),
        ),
        useMaterial3: true,
      ),
      home: const Loading(),
    );
  }
}
