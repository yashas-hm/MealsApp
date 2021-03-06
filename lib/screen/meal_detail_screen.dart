import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {

  final Function toggleFav;
  final Function checkFav;

  MealDetailScreen(this.toggleFav, this.checkFav);

  Widget buildTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildListContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blueGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealData = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${mealData.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealData.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, "Ingredients"),
            buildListContainer(ListView.builder(
              itemBuilder: (context, index) => Card(
                color: Colors.greenAccent,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(mealData.ingredients[index]),
                ),
              ),
              itemCount: mealData.ingredients.length,
            )),
            buildTitle(context, "Steps"),
            buildListContainer(ListView.builder(
              itemBuilder: (context, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('#${(index + 1)}'),
                    ),
                    title: Text(mealData.steps[index]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: mealData.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: checkFav(mealData)?FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () => {
          toggleFav(mealId)
        },
      ):FloatingActionButton(
        child: Icon(Icons.favorite_border),
        onPressed: () => {
        toggleFav(mealId)
      },
      ),
    );
  }
}
