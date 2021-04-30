import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    final darkTextTheme = Theme.of(context).textTheme.apply(fontFamily: 'Open Sans',
          bodyColor: Colors.black,
          displayColor: Colors.black,
        );
    final lightTextTheme = Theme.of(context).textTheme.apply(fontFamily: 'Open Sans',
          bodyColor: Color(0xffa9a9b3),
          displayColor: Color(0xffa9a9b3),
        );

    return ThemeData( 
      iconTheme:
          IconThemeData(color: isDarkTheme ? Color(0xffa9a9b3) : Colors.black),
      textTheme: isDarkTheme ? lightTextTheme : darkTextTheme,
      canvasColor: isDarkTheme ? Color(0xff292a2d) : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: isDarkTheme ? Color(0xffa9a9b3) : Colors.black),
        textTheme: isDarkTheme ? lightTextTheme : darkTextTheme,
        backgroundColor: isDarkTheme ? Color(0xff252627) : Color(0xffF5F5F5),
        elevation: 0.0,
      ),
    );
  }
}
