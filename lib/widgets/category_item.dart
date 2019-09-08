import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem(this.category);

  void selectCategory(BuildContext context) {
    Navigator.of(context)
        .pushNamed(CategoryMealsScreen.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [category.color.withOpacity(0.8), category.color])),
        padding: const EdgeInsets.all(8.0),
        key: ValueKey(category.id),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
