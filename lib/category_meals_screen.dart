import 'package:flutter/material.dart';

import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {

  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMealsScreen({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final filtered = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
        
    return Scaffold(
            appBar: AppBar(
              title: Text(
                categoryTitle,
              ),
            ),
            body: ListView.builder(itemBuilder: (context, index) {
              return Text(filtered[index].title);
            },itemCount: filtered.length,),
          );
  }
}

