import 'package:flutter/material.dart';

import 'package:mealapp/Activities/Recipe.dart';

class CategoryItem extends StatelessWidget {
  final String Id;
  final String Title;
  final Color colors;
  CategoryItem({required this.Id, required this.Title, required this.colors});

  void _selectedItem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      Recipe.routeName,
      arguments: {
        'id': Id,
        'title': Title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedItem(context),
      splashColor: Theme.of(context).colorScheme.tertiary,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colors.withOpacity(0.7),
              colors,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          Title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
