import 'package:portfolio/config/constants.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class ExperienceWidget extends StatelessWidget {
  final experience;
  final index;
  final length;
  const ExperienceWidget(this.experience,this.index,this.length);


  @override
  Widget build(BuildContext context) {
    double topBottomPadding = (index == 0 || index == length - 1) ? 16.0 : 8.0;
    return InkWell(
      onTap: ()=>html.window.open(Constants.BLOG_URL+experience.uniqueSlug, 'adityadroid'),
      child: Card(
        margin:
        EdgeInsets.fromLTRB(16.0, topBottomPadding, 16.0, topBottomPadding),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                Constants.MEDIUM_IMAGE_CDN + experience.virtuals.previewImage.imageId,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                experience.title,
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 8,
              ),
              Text(experience.content.subtitle,
                  style: Theme.of(context).textTheme.subtitle),
              //Text(blog.virtuals.totalClapCount)
            ],
          ),
        ),
      ),
    );
  }
}