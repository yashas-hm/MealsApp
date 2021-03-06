import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './favourites_screen.dart';
import './categories_screen_dart.dart';


class TabsScreen extends StatefulWidget {

  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  State<StatefulWidget> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {'page' : CategoriesScreen(), 'title': 'Categories'},
      {'page' : FavouritesScreen(widget.favouriteMeals), 'title': 'Favourites'},
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blueGrey,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
