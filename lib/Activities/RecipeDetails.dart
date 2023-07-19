import 'package:flutter/material.dart';
import 'package:mealapp/DummyData.dart';

class RecipeDetails extends StatelessWidget {
  static const String routeName = '/RecipeDetails';
  Widget buildTitle(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 36,
      ),
    );
  }

  Widget buildListContainer(BuildContext context, Widget _child) {
    return Container(
      height: 150,
      width: 250,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 10,
        ),
      ),
      child: _child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final bool _isConnected = _routeArgs['connect'].toString() == 'true';
    print(_isConnected);
    final _details = DUMMY_MEALS.firstWhere((element) {
      return element.id.contains(_routeArgs['id'].toString());
    });
    final _appBar = AppBar(
      title: Text(
        _details.title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
    return Scaffold(
      appBar: _appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: !_isConnected
                  ? Icon(
                      Icons.image,
                    )
                  : Image.network(
                      _details.imageUrl,
                      fit: BoxFit.cover,
                    ),
            ),
            buildTitle(context, "Ingredients"),
            buildListContainer(
              context,
              ListView.builder(
                itemCount: _details.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        _details.ingredients[index],
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  );
                },
              ),
            ),
            buildTitle(context, "Steps"),
            buildListContainer(
              context,
              ListView.builder(
                itemCount: _details.steps.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Theme.of(context).colorScheme.primary,
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.tertiary,
                            child: Text("# ${index + 1}"),
                          ),
                          title: Text(
                            _details.steps[index],
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        const Divider(
                          thickness: 5,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.favorite,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}
