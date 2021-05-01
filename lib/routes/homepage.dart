import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/ui_widgets/appbar.dart';
import 'package:portfolio/ui_widgets/copyright.dart';
import 'package:portfolio/routes/aboutme.dart';
import 'package:portfolio/routes/blogpage.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  static const String route = '/';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    bool _screenLargeSmall = screenSize.width > 1300 || screenSize.width < 800;
    bool smallWidth = screenSize.width < 800; 
    return Scaffold(
      appBar: MyAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedPadding(
                  duration: Duration(seconds: 1),
                  padding:
                      EdgeInsets.only(top: smallWidth ? 15 : 30, bottom: 37),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: _screenLargeSmall
                        ? screenSize.height * 0.19
                        : screenSize.width * 0.19,
                    width: _screenLargeSmall
                        ? screenSize.height * 0.19
                        : screenSize.width * 0.19,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/dp.png'),
                        )),
                  )),
              Text('Naveen K',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  )),
              SizedBox(
                height: 35,
              ),
              Text('Software Engineer',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 22,
                  )),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  bottom: 15,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: boxes('About me'),
                  onTap: () => Navigator.of(context).pushNamed(AboutPage.route),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                child: boxes('Blog'),
                onTap: () => Navigator.of(context).pushNamed(BlogPage.route),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 30),
                  child: logos()),
              Copyright(
                launchurl: launchURL,smallsize:smallWidth
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget logos() {
    final _twitterUrl = 'https://twitter.com/NavDevLife';
    final _instaUrl = 'https://www.instagram.com/naveenkmavoor/';
    final _linkedinUrl = 'https://www.linkedin.com/in/naveen-k97/';
    final _githubUrl = 'https://github.com/Naveenmavoor';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          splashRadius: 30,
          icon: Icon(FontAwesomeIcons.twitter),
          onPressed: () => launchURL(_twitterUrl),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: IconButton(
              splashRadius: 30,
              icon: Icon(
                FontAwesomeIcons.instagram,
              ),
              onPressed: () => launchURL(_instaUrl),
            )),
        IconButton(
            splashRadius: 30,
            icon: Icon(FontAwesomeIcons.linkedin),
            onPressed: () => launchURL(_linkedinUrl)),
        SizedBox(
          width: 30,
        ),
        IconButton(
          splashRadius: 30,
          icon: Icon(FontAwesomeIcons.github),
          onPressed: () => launchURL(_githubUrl),
        ),
      ],
    );
  }

  Widget boxes(String text) {
    return Container(
      alignment: Alignment.center,
      width: 225,
      height: 45,
      decoration: BoxDecoration(
          color: Color(0xffa9a9b3).withOpacity(0.15),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 22,
          letterSpacing: 1.25,
        ),
      ),
    );
  }
}
