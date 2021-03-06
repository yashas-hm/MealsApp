import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {

  final Function filterData;
  final Map<String, bool> filters;

  FilterScreen(this.filterData, this.filters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchTile(String title, bool value) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text('Only include $title meals.'),
      value: value,
      onChanged: (newValue) {
        setState(() {
          value = newValue;
        });
      },
    );
  }

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _vegan = widget.filters['vegan'];
    _lactoseFree = widget.filters['lactose'];
    _vegetarian = widget.filters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: () {
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };
            widget.filterData(selectedFilters);
          },)
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust you meal preference.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                  'Gluten-Free',
                  _glutenFree,
                ),
                _buildSwitchTile(
                  'Vegetarian',
                  _vegetarian,
                ),
                _buildSwitchTile(
                  'Vegan',
                  _vegan,
                ),
                _buildSwitchTile(
                  'Lactose-Free',
                  _lactoseFree,
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
