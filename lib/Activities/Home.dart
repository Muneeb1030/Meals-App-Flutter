import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:mealapp/DummyData.dart';
import 'package:mealapp/Widgets/CategoryItem.dart';

class Home extends StatelessWidget {
  static const String routename = '/home';
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, bool>;
    final bool _isConnected = _routeArgs['connect'].toString() == 'true';
    final double _height = _mediaQuery.size.height -
        //_appBar.preferredSize.height -
        _mediaQuery.padding.top;
    return Scaffold(
      body: Container(
        height: _height,
        child: GridView(
          padding: const EdgeInsets.all(5),
          children: DUMMY_CATEGORIES
              .map((_data) => CategoryItem(
                    Id: _data.id,
                    Title: _data.title,
                    colors: _data.color,
                    isConnected: _isConnected,
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 2,
          ),
        ),
      ),
    );
  }
}
