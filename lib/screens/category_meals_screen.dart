import 'package:flutter/material.dart';
import 'package:great_meals/widgets/meal_item.dart';
import '../models/meal.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatefulWidget {
  static final String routeName = 'category-meals';
  final Map<String, bool> filters;
  final List<Meal> meals;

  const CategoryMealsScreen(this.meals, this.filters);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> allMeals;

  @override
  void initState() {
    super.initState();

    allMeals = widget.meals;
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
      if (widget.filters['gluten'] && !meal.isGlutenFree) {
        return false;
      }
      if (widget.filters['vegan'] && !meal.isVegan) {
        return false;
      }
      if (widget.filters['vegeterian'] && !meal.isVegetarian) {
        return false;
      }
      if (widget.filters['lactose'] && !meal.isLactoseFree) {
        return false;
      }
      return true;
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
          return MealItem(meal: visibleMeals[i]);
        },
      ),
    );
  }
}
