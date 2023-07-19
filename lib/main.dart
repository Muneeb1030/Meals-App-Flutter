import 'package:flutter/material.dart';

import 'package:mealapp/Activities/Home.dart';
import 'package:mealapp/Activities/Loading.dart';
import 'package:mealapp/Activities/Recipe.dart';
import 'package:mealapp/Activities/RecipeDetails.dart';

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
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 80, 80, 80),
          secondary: Color.fromARGB(255, 80, 80, 80),
          tertiary: Color.fromARGB(255, 189, 189, 199),
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 227, 227, 225),
        fontFamily: 'Agdasima',
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 36,
            color: Color.fromARGB(255, 189, 189, 199),
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        Home.routename: (context) => Home(),
        Recipe.routeName: (context) => Recipe(),
        RecipeDetails.routeName: (context)=>RecipeDetails(),
      },
    );
  }
}
