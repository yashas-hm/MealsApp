import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';


class FavouritesScreen extends StatelessWidget{

  final List<Meal> categoryMeals;

  FavouritesScreen(this.categoryMeals);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(
          id: categoryMeals[index].id,
          title: categoryMeals[index].title,
          imageUrl: categoryMeals[index].imageUrl,
          duration: categoryMeals[index].duration,
          affordability: categoryMeals[index].affordability,
          complexity: categoryMeals[index].complexity,
        );
      },
      itemCount: categoryMeals.length,
    );
  }

}