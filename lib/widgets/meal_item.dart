import 'package:flutter/material.dart';
import 'package:great_meals/models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function deleteMeal;

  const MealItem(this.meal, this.deleteMeal);

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetail.routeName, arguments: meal.id)
        .then((result) {
      if (result != null) {
        deleteMeal(result);
      }
    });
  }

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';

      case Complexity.Challenging:
        return 'Challenging';

      case Complexity.Hard:
      default:
        return 'Hard';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Luxurious:
        return 'Expensive';

      case Affordability.Pricey:
        return 'So so';

      case Affordability.Affordable:
      default:
        return 'Cheap';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    child: Hero(
                      child: Image.network(
                        meal.imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      tag: meal.imageUrl,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 220,
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(color: Colors.black54),
                    child: Text(
                      meal.title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontSize: 26.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('${meal.duration} minutes')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.monetization_on),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
