import 'dart:ui';

import 'package:portfolio/config/assets.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/tabs/about_tab.dart';
import 'package:portfolio/tabs/experiences_tab.dart';
import 'package:portfolio/tabs/projects_tab.dart';
import 'package:portfolio/widgets/theme_inherited_widget.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> tabWidgets = <Widget>[
    AboutTab(),
    ExperienceTab(),
    ProjectsTab(),
  ];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: ThemeSwitcher.of(context).isDarkModeOn?Icon(Icons.wb_sunny):Image.asset(Assets.moon,height: 20,width: 20,),
              onPressed: ()=> ThemeSwitcher.of(context).switchDarkMode(),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ThemeSwitcher.of(context).isDarkModeOn?AssetImage("assets/bg_dark.jpg"):AssetImage("assets/bg_light.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Center(
              child: tabWidgets.elementAt(_selectedIndex),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('About'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              title: Text('Experience'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              title: Text('Projects'),
            )
          ],
          currentIndex: _selectedIndex,
          onTap: (index)=> setState(() => _selectedIndex = index),
          selectedItemColor: Theme.of(context).accentColor,
        ),
    );
  }

}
