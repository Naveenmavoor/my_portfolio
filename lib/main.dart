import 'package:flutter/material.dart';
import 'package:portfolio/darktheme_provider.dart'; 
import 'package:portfolio/routes/homepage.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/model/styles.dart';
import 'package:portfolio/routes/aboutme.dart';
import 'package:url_strategy/url_strategy.dart';
import './routes/aboutme.dart';


void main() {
    setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            initialRoute: MyHomePage.route,
            routes: {
              MyHomePage.route: (context) => MyHomePage(),
              AboutPage.route: (context) => AboutPage(), 
            },
          );
        },
      ),
    );
  }
}
