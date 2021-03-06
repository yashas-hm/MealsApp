import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> categoryMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
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
      ),
    );
  }
}
