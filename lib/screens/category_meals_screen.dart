import 'package:flutter/material.dart';
import 'package:great_meals/widgets/meal_item.dart';
import '../models/meal.dart';
import '../models/category.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static final String routeName = 'category-meals';
  final Map<String, bool> filters;

  const CategoryMealsScreen(this.filters);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> allMeals;

  @override
  void initState() {
    super.initState();

    allMeals = DUMMY_MEALS;
  }

  void deleteMeal(String mealId) {
    setState(() {
      allMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Category category = ModalRoute.of(context).settings.arguments;
    setState(() {
      allMeals = allMeals.where((meal) {
        return meal.categories.contains(category.id);
      }).toList();
    });
  }

  List<Meal> get visibleMeals {
    return allMeals.where((meal) {
      bool isValid = true;
      if (widget.filters['gluten'] && !meal.isGlutenFree) {
        isValid = false;
      }
      if (widget.filters['vegan'] && !meal.isVegan) {
        isValid = false;
      }
      if (widget.filters['vegeterian'] && !meal.isVegetarian) {
        isValid = false;
      }
      if (widget.filters['lactose'] && !meal.isLactoseFree) {
        isValid = false;
      }
      return isValid;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CategoryMealsScreen'),
      ),
      body: ListView.builder(
        itemCount: visibleMeals.length,
        itemBuilder: (_, i) {
          return MealItem(visibleMeals[i], deleteMeal);
        },
      ),
    );
  }
}
