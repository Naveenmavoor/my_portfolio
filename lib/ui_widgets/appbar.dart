import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:universal_html/html.dart' as html;

import 'package:portfolio/animation.dart';
import 'package:portfolio/darktheme_provider.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(68);
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  final _url = "https://naveenkmavoor.tech";

  _launchURL() async {
    html.window.location.assign(_url);
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 68,
      titleSpacing: pow((screenSize.width / 79), 2) as double?,
      title: MouseRegion(cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _launchURL,
          child: Row(
            children: [
              Text(
                '> \$  cd  /home/',
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              AnimateFadeTransition(),
            ],
          ),
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
