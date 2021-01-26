import 'package:flutter/material.dart';
import 'package:resume/models/models.dart';

import 'section_title_text.dart';

class ExperienceWidget extends StatelessWidget {
  final Experience model;

  final defaultPadding = const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );

  const ExperienceWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SectionTitleText(model.title ?? "Experince"),
          ...List<Widget>.generate(
            model.jobs.length,
            (index) => Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: defaultPadding,
                      child: Text(
                        model.jobs[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: defaultPadding - const EdgeInsets.only(top: 4),
                      child: Text(
                        model.jobs[index].subtitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: defaultPadding,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 14,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .color
                                .withOpacity(0.75),
                          ),
                          SizedBox(width: 8),
                          Text(
                            model.jobs[index].interval,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .color
                                  .withOpacity(0.75),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...model.jobs[index].description
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 8),
                              child: Text(
                                e,
                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.start,
                              ),
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
