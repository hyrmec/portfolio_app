import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/widgets/theme_inherited_widget.dart';
import 'package:flutter/material.dart';

import 'config/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitcherWidget(
      initialDarkModeOn: false,
      child: Portfolio(),
    );
  }
}
class Portfolio extends StatelessWidget {
  const Portfolio({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pavel Nikulshin',
      theme:ThemeSwitcher.of(context).isDarkModeOn?darkTheme(context):lightTheme(context),
      home: HomePage(),
    );
  }
}
