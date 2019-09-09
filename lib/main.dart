import 'package:flutter/material.dart';
import 'package:great_meals/dummy_data.dart';
import 'package:great_meals/models/meal.dart';
import 'package:great_meals/screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './theme.dart';
import './dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> meals;
  List<Meal> favouriteMeals;

  var filters = {
    'gluten': false,
    'vegan': false,
    'vegeterian': false,
    'lactose': false,
  };

  void initState() {
    super.initState();
    meals = DUMMY_MEALS;
    favouriteMeals = [];
  }

  void _handleChangeFilter(Map<String, bool> filters) {
    setState(() {
      this.filters = filters;
    });
  }

  void _toggleFavourite(String mealId) {
    int existingIndex = favouriteMeals.indexWhere((meal) => meal.id == mealId);
    setState(() {
      if (existingIndex == -1) {
        favouriteMeals.add(meals.firstWhere((meal) => meal.id == mealId));
      } else {
        favouriteMeals.removeWhere((meal) => meal.id == mealId);
      }
    });
  }

  bool _isFavouriteMeal(String mealId) {
    return favouriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp._title,
      theme: theme,
      routes: {
        CategoriesScreen.routeName: (_) => TabsScreen(favouriteMeals),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(
              meals,
              filters,
            ),
        MealDetail.routeName: (_) => MealDetail(
              _toggleFavourite,
              _isFavouriteMeal,
            ),
        FilterScreen.routeName: (_) => FilterScreen(
              filters,
              _handleChangeFilter,
            ),
      },
    );
  }
}
