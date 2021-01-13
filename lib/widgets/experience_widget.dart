import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/models/models.dart';

class ExperienceWidget extends StatelessWidget {
  final Experience model;
  const ExperienceWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            model.title ?? "Experince",
            style: Theme.of(context).textTheme.headline4,
          ),
          ...List<Widget>.generate(
            model.jobs.length,
            (index) => Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(model.jobs[index].title),
                    subtitle: Text(
                      model.jobs[index].subtitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        FaIcon(FontAwesomeIcons.businessTime),
                        SizedBox(width: 16),
                        Text(
                          model.jobs[index].interval,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  ...model.jobs[index].description
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(e, textAlign: TextAlign.start),
                          ))
                      .toList(),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}