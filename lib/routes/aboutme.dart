import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/routes/homepage.dart';
import 'package:portfolio/ui_widgets/appbar.dart';
import 'package:portfolio/ui_widgets/copyright.dart';

class AboutPage extends StatelessWidget {
  static const String route = '/about';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: MyAppBar(),
        body: Scrollbar(
          isAlwaysShown: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: pow((screenSize.width / 79), 2) as double),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'About',
                    style: TextStyle(
                        height: 2.5,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: Text(
                      'Coding',
                      style: TextStyle(
                          height: 2,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ),
                  Text(
                    '''I am Naveen K, a Software Engineer with some years of experience and a big passion for developing applications for both Web and Mobile Platforms using Flutter, Configuring microcontrollers(Raspberry pi and Esp8266) for Internet of Things, and a little bit of knowledge on Backend using Golang.

I focus on delivering high-quality Mobile/Web applications using state managements like Provider,redux and Scoped Model. Big fan of Linux!

''',
                    style: TextStyle(
                      height: 1.7,
                      letterSpacing: 1.5,
                      fontSize: 15.5,
                    ),
                  ),
                  Text(
                    'Core expertise',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '''
• Dart
• Golang
• Internet of Things
''',
                    style: TextStyle(
                      height: 1.7,
                      letterSpacing: 1,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                      '''Worked with framework Flutter for dart by building applications in both Mobile/Web platforms. Embedded programming using C++ and Python for interfacing it with the Cloud and Frontend/Backend Application using Mqtt and Http. I enjoy using Golang for backend development.
Currently self learning and looking forward to land on a dream company :).''',
                      style: TextStyle(
                        height: 1.7,
                        letterSpacing: 1,
                        fontSize: 16,
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text('Personal interests',
                        style: TextStyle(
                            height: 2,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1)),
                  ),
                  Text(
                    '''Besides my passion for coding I have a big passion for fitness. On my socials I preach about it and I believe that (especially) developers, should be more conscious about the long-term postive effects of staying active and maintaining a healthy work/life balance.
 ''',
                    style: TextStyle(
                      height: 1.7,
                      letterSpacing: 1,
                      fontSize: 16,
                    ),
                  ),
                  Divider(
                    color: Color(0xffa9a9b3),
                    thickness: 0.25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 90, bottom: 30),
                    child: Copyright(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
