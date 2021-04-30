import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio/animation.dart';
import 'package:portfolio/darktheme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(68);
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
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
    final screenSize = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 68,
      titleSpacing: pow((screenSize.width / 79), 2) as double?,
      title: GestureDetector(
        onTap: _launchURL,
        child: Row(
          children: [
          
            Text(
              '> \$  cd  /home/',
              style: TextStyle(
                  fontSize: 18, 
                  letterSpacing: 1, ),
            ),
            SizedBox(
              width: 5,
            ),
            AnimateFadeTransition(),
          ],
        ),
      ),
      actions: <Widget>[
        IconButton(
          splashRadius: 25,
          icon:
              Icon(themeChange.darkTheme ? Icons.wb_sunny : Icons.brightness_2),
          onPressed: () {
            themeChange.darkTheme = !themeChange.darkTheme;
          },
        ),
        SizedBox(
          width: pow((screenSize.width / 79), 2) as double?,
        )
      ],
    );
  }
}
