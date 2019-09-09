import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  const FavouriteScreen(this.favouriteMeals);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.favouriteMeals.isEmpty
        ? Center(
            child: Text('No favourite meals yet'),
          )
        : ListView.builder(
            itemCount: widget.favouriteMeals.length,
            itemBuilder: (_, i) {
              return MealItem(
                  meal: widget.favouriteMeals[i],
                  popHandler: () {
                    setState(() {});
                  });
            },
          );
  }
}
