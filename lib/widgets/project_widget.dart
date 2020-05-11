import 'package:portfolio/models/project_model.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class ProjectWidget extends StatelessWidget {
  final Project _project;
  final double _bottomPadding;
  ProjectWidget(this._project,this._bottomPadding );

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(16.0,16.0,16.0,_bottomPadding),
        child:InkWell(
          onTap: onProjectClick,
          child:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                radius: 40,
                backgroundImage: Image.asset(_project.image).image,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                _project.name,
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 5,
              ),
              Text(_project.description,
                  style: Theme.of(context).textTheme.subtitle),
            ],
          ),
        ),
      ),
    );
  }

  void onProjectClick(){
      if(_project.link!=null)
       html.window.open(_project.link, 'hyrmec');
    }

}
