import 'package:flutter/material.dart';
import 'package:mealapp/DummyData.dart';
import 'package:mealapp/Widgets/MealItem.dart';

class Recipe extends StatelessWidget {
  static const String routeName = '/recipe';
  const Recipe({super.key});

  @override
  Widget build(BuildContext context) {
    final _recipeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final _id = _recipeArgs['id'];
    final _title = _recipeArgs['title'];
    final _meals = DUMMY_MEALS.where(
      (element) {
        return element.categories.contains(_id);
      },
    ).toList();
    print(_meals);
    final _mediaQuery = MediaQuery.of(context);
    final _appBar = AppBar(
      title: Text(
        _title.toString(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
    final double _height = _mediaQuery.size.height -
        _appBar.preferredSize.height -
        _mediaQuery.padding.top;
    return Scaffold(
      appBar: _appBar,
      body: ListView.builder(
        itemCount: _meals.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
              Id: _meals[index].id,
              title: _meals[index].title,
              imageUrl: _meals[index].imageUrl,
              affordability: _meals[index].affordability,
              complexity: _meals[index].complexity,
              duration: _meals[index].duration);
        },
      ),
    );
  }
}
