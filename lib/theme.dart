import 'package:flutter/material.dart';

const color = {
  50: Color.fromRGBO(11, 22, 101, .1),
  100: Color.fromRGBO(11, 22, 101, .2),
  200: Color.fromRGBO(11, 22, 101, .3),
  300: Color.fromRGBO(11, 22, 101, .4),
  400: Color.fromRGBO(11, 22, 101, .5),
  500: Color.fromRGBO(11, 22, 101, .6),
  600: Color.fromRGBO(11, 22, 101, .7),
  700: Color.fromRGBO(11, 22, 101, .8),
  800: Color.fromRGBO(11, 22, 101, .9),
  900: Color.fromRGBO(11, 22, 101, 1),
};

final companyColor = const MaterialColor(0xFF0D0D51, color);

final theme = ThemeData(
  fontFamily: 'Raleway',
  primarySwatch: companyColor,
  primaryColor: companyColor.shade900,
  canvasColor: Colors.white,
  textTheme: ThemeData.dark().textTheme.copyWith(
        title: TextStyle(
          fontSize: 20,
          color: Color(0xFF626EBC),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
        body1: TextStyle(
          color: Color(
            0xFF626EBC,
          ),
          fontSize: 16,
        ),
        body2: TextStyle(
          color: Color(0xFF626EBC).withOpacity(0.8),
          fontSize: 14,
        ),
      ),
  accentColor: Color(0xFF00E7FF),
);
