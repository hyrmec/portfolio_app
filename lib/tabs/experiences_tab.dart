import 'dart:html' as html;

import 'package:portfolio/config/constants.dart';
import 'package:portfolio/models/experiences_model.dart';
import 'package:portfolio/providers/api_provider.dart';
import 'package:portfolio/widgets/experiences_widget.dart';
import 'package:portfolio/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class ExperienceTab extends StatefulWidget {
  @override
  _ExperienceTabState createState() => _ExperienceTabState();
}

class _ExperienceTabState extends State<ExperienceTab> {
  ApiProvider _apiProvider = ApiProvider();
  List<Experience> _experiences = [];
  bool _loadingData = true;
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    loadExperiences();
  }

  @override
  Widget build(BuildContext context) {
    if (_loadingData)
      return Center(
        child: CircularProgressIndicator(),
      );
    if(_showError){
      return Center(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Something went wrong',style: Theme.of(context).textTheme.headline,),
            ),
            RaisedButton(
              child: Text('Retry',style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),),
              elevation: 0.0,
              onPressed:loadExperiences,
            )
          ],
        )
      );
    }
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
                itemCount: _experiences.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    ExperienceWidget(_experiences[index], index, _experiences.length)),
            RaisedButton(
              child: Text('More',style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),),
              elevation: 0.0,
              onPressed: () =>
                  html.window.open(Constants.PROFILE_MEDIUM, 'adityadroid'),
            )
          ],
        ),
      ),
    );
  }

  void loadExperiences() async {
    setState(() {
      _loadingData = true;
      _showError = false;
    });
    final result = await _apiProvider.getExperiences();
    setState(() {
      if(result==null) {
        _showError = true;
        _loadingData = false;
      }else{
      _experiences = result;
      _showError = false;
      _loadingData = false;
      }
    });
  }
}
