import 'package:flutter/material.dart';
import 'package:portfolio/model/darktheme_provider.dart';
import 'package:portfolio/model/styles.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
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
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 68,
        title: GestureDetector(
          onTap: _launchURL,
          child: Row(
            children: [
              Text('>'),
              Text(
                ' \$',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              Text('  cd  /home/')
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              themeChange.darkTheme ? Icons.brightness_2 : Icons.wb_sunny,
            ),
            onPressed: () {
              setState(() {
                themeChange.darkTheme = !themeChange.darkTheme;
              });
            },
          )
        ],
      ),
      body: Center(),
    );
  }
}
