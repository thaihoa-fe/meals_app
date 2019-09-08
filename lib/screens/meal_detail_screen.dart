import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetail extends StatelessWidget {
  static final String routeName = 'meal-detail';

  Widget _buildSectionTitle(String title, BuildContext context) {
    final themeData = Theme.of(context);
    final titleStyle = themeData.textTheme.title;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: titleStyle,
      ),
    );
  }

  Widget _buildContainer(Widget child, BuildContext context,
      [double height = 150]) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: height,
      child: child,
      width: 300,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Hero(
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
                tag: meal.imageUrl,
              ),
            ),
            _buildSectionTitle('Ingredients', context),
            _buildContainer(
                ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (_, i) => Card(
                    color: themeData.accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 8),
                      child: Text(meal.ingredients[i]),
                    ),
                  ),
                ),
                context),
            _buildSectionTitle('Steps', context),
            _buildContainer(
                ListView.separated(
                  separatorBuilder: (_, i) => Divider(),
                  itemCount: meal.steps.length,
                  itemBuilder: (_, i) => ListTile(
                    leading: CircleAvatar(
                      child: Text('${i + 1}'),
                    ),
                    title: Text(
                      meal.steps[i],
                      style: themeData.textTheme.body1,
                    ),
                  ),
                ),
                context,
                300),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(meal.id);
        },
      ),
    );
  }
}
