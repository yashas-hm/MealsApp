import 'dart:io';

import 'package:MealsApp/categories_screen_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealsApp extends StatelessWidget {
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
      home: CategoriesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  Widget _buildAppbar() {
    return Platform.isIOS ?
    CupertinoNavigationBar(
      middle: Text("Meals App"),
    ) :
    AppBar(
      title: Text("Meals App"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = _buildAppbar();

    return Platform.isIOS ?
    CupertinoPageScaffold(
      child: Center(
        child: Text("hello"),
      ),
      navigationBar: appBar,
    ) :
    Scaffold(
      appBar: appBar,
      body: Center(
        child: Text("Hello"),
      ),
    );
  }

}
