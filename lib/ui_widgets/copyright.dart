import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  final Function? launchurl;
  final bool smallsize;
  final url = 'https://naveenkmavoor.tech';
  Copyright({this.launchurl, this.smallsize = false});

  @override
  Widget build(BuildContext context) {
    return smallsize
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(' © 2020 ', style: TextStyle(fontSize: 17)),
              GestureDetector(
                  onTap: () => launchurl!(url),
                  child: Text(
                    " Naveen K",
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 17),
                  ))
            ],
          )
        : Row(
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
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 17),
                  ))
            ],
          );
  }
}
