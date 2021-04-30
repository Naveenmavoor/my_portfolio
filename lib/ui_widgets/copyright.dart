import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  final Function? launchurl;
   final url = 'https://flutter.io';
  Copyright({this.launchurl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(' © 2020 ', style: TextStyle(fontSize: 17)),
        Text(
          " · ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        GestureDetector(
            onTap: () => launchurl!(url),
            child: Text(
              " Naveen K",
              style:
                  TextStyle(decoration: TextDecoration.underline, fontSize: 17),
            ))
      ],
    );
  }
}
