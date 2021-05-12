import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:universal_html/html.dart' as html;

class Copyright extends StatelessWidget {
  final bool smallsize;
  final _url = "https://naveenkmavoor.tech";
  Copyright({this.smallsize = false});

  _launchURL() async {
    html.window.location.assign(_url);
  }

  @override
  Widget build(BuildContext context) {
    return smallsize
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(' © 2020 ', style: TextStyle(fontSize: 17)),
              MouseRegion(cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: () {
                      _launchURL();
                    },
                    child: Text(
                      " Naveen K",
                      style: TextStyle(
                          decoration: TextDecoration.underline, fontSize: 17),
                    )),
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' © 2021 ', style: TextStyle(fontSize: 17)),
              Text(
                " · ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: () {
                      _launchURL();
                    },
                    child: Text(
                      " Naveen K",
                      style: TextStyle(
                          decoration: TextDecoration.underline, fontSize: 17),
                    )),
              )
            ],
          );
  }
}
