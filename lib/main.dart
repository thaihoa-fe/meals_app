import 'package:flutter/material.dart';
import 'package:great_meals/screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var filters = {
    'gluten': false,
    'vegan': true,
    'vegeterian': true,
    'lactose': false,
  };

  void _handleChangeFilter(Map<String, bool> filters) {
    setState(() {
      this.filters = filters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp._title,
      theme: theme,
      routes: {
        CategoriesScreen.routeName: (_) => TabsScreen(),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(filters),
        MealDetail.routeName: (_) => MealDetail(),
        FilterScreen.routeName: (_) => FilterScreen(
              filters,
              _handleChangeFilter,
            ),
      },
    );
  }
}
