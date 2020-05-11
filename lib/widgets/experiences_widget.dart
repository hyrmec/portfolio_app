import 'package:flutter/material.dart';

class ExperienceWidget extends StatelessWidget {
  final _experience;
  final index;
  final length;
  const ExperienceWidget(this._experience,this.index,this.length);


  @override
  Widget build(BuildContext context) {
    double topBottomPadding = (index == 0 || index == length - 1) ? 16.0 : 8.0;
    return InkWell(
      child: Card(
        margin:
        EdgeInsets.fromLTRB(16.0, topBottomPadding, 16.0, topBottomPadding),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 18,
              ),
              Text(
                _experience.yearsOld,
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 12,
              ),
              Text(_experience.place,
                  style: Theme.of(context).textTheme.subtitle),
              SizedBox(
                height: 10,
              ),
              Text(_experience.description,
                  style: Theme.of(context).textTheme.subtitle),
              //Text(blog.virtuals.totalClapCount)
            ],
          ),
        ),
      ),
    );
  }
}