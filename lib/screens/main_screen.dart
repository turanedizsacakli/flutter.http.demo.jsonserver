import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http_demo/data/api/category_api.dart';

import '../models/category.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State {
  late List<Category> categories=<Category>[];
  //var categories=<Category>();
  late List<Widget> categoryWidgets=<Widget>[];

  @override
  void initState() {
    getCategoriesFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(categories);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ETrade System",
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            )
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((value) {
      setState(() {
        Iterable list = json.decode(value.body);
        this.categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });print(categories);
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
      print(categories[i]);
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return ElevatedButton(
      child: Text(
        category.categoryName,
        style: TextStyle(color: Colors.red, fontSize: 20.0),
      ),
      onPressed: (){},
    );
  }
}
