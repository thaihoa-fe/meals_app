import 'package:flutter/material.dart';
import 'package:great_meals/widgets/main_drawer.dart';
import './favourite_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Map<String, Object>> pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouriteScreen(), 'title': 'Your Favourites'},
  ];

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedPage = 0;

  void selectPage(index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text(widget.pages[_selectedPage]['title']),
        ),
        body: widget.pages[_selectedPage]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: themeData.primaryColor,
          unselectedItemColor: themeData.accentColor.withOpacity(0.6),
          selectedItemColor: themeData.accentColor,
          selectedFontSize: 16,
          unselectedFontSize: 14,
          onTap: selectPage,
          currentIndex: _selectedPage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text('Categories')),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: Text('Favourite')),
          ],
        ),
      ),
    );
  }
}
