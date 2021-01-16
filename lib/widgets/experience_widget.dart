import 'package:flutter/material.dart';
import 'package:resume/models/models.dart';

import 'section_title_text.dart';

class ExperienceWidget extends StatelessWidget {
  final Experience model;
  const ExperienceWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SectionTitleText(model.title ?? "Experince"),
          ...List<Widget>.generate(
            model.jobs.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        model.jobs[index].title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        model.jobs[index].subtitle,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16) +
                          const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 16,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(0.7),
                          ),
                          SizedBox(width: 8),
                          Text(
                            model.jobs[index].interval,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .color
                                  .withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...model.jobs[index].description
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 8),
                              child: Text(e, textAlign: TextAlign.start),
                            ))
                        .toList(),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
