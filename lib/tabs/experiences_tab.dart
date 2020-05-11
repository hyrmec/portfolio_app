import 'dart:html' as html;

import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/experiences.dart';
import 'package:portfolio/widgets/experiences_widget.dart';
import 'package:portfolio/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class ExperienceTab extends StatefulWidget {
  @override
  _ExperienceTabState createState() => _ExperienceTabState();
}

class _ExperienceTabState extends State<ExperienceTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: ExperienceList(),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
      smallScreen: ExperienceList(),
    );
  }

  Widget ExperienceList() {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView.builder(
                itemCount: experiences.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    ExperienceWidget(experiences[index], index, experiences.length)),
          ],
        ),
      ),
    );
  }
}
