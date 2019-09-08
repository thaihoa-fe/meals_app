import 'package:flutter/material.dart';
import 'package:great_meals/screens/categories_screen.dart';
import 'package:great_meals/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(String title, IconData iconData, Function tapHandler) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(fontFamily: 'RobotoConsended', fontSize: 24),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 80,
            alignment: Alignment.centerLeft,
            width: double.infinity,
            padding: EdgeInsets.only(left: 20, right: 20, top: paddingTop),
            color: Theme.of(context).accentColor,
            child: Text(
              'Best app ever',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context)
                .pushReplacementNamed(CategoriesScreen.routeName);
          }),
          _buildListTile('Settings', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
