import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screen/filter_screen.dart';
import './screen/tabs_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/category_meals_screen.dart';

void main() {
  runApp(MealsApp());
}

class MealsApp extends StatefulWidget {
  @override
  _MealsAppState createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _toggleFavourite(String mealId){
    final existingIndex = _favouriteMeals.indexWhere((element) => element.id==mealId);
    if(existingIndex>=0){
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id==mealId));
      });
    }
  }

  bool _isMealFavourite(Meal meal){
    return _favouriteMeals.contains(meal);
  }

  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree)
          return false;

        if (_filters['lactose'] && !meal.isLactoseFree)
          return false;

        if (_filters['vegan'] && !meal.isVegan)
          return false;

        if (_filters['vegetarian'] && !meal.isVegetarian)
          return false;

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals App",
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.blueAccent,
        fontFamily: 'Quicksand',
        textTheme: ThemeData
            .light()
            .textTheme
            .copyWith(
          headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.normal),
          button: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData
              .light()
              .textTheme
              .copyWith(
            headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans'),
          ),
        ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favouriteMeals),
        '/category-meals': (context) => CategoryMealsScreen(_availableMeals),
        '/details-meals': (context) => MealDetailScreen(_toggleFavourite, _isMealFavourite),
        '/filter-screen': (context) => FilterScreen(_setFilters, _filters),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}