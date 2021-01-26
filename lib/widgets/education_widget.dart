import 'package:flutter/material.dart';
import 'package:resume/models/models.dart';

import 'section_title_text.dart';

class EducationWidget extends StatelessWidget {
  final Education model;

  final defaultPadding = const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );

  const EducationWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SectionTitleText(model.title ?? "Education"),
          ...List<Widget>.generate(
            model.data.length,
            (index) => Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: defaultPadding,
                      child: Text(
                        model.data[index].place,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: defaultPadding - const EdgeInsets.only(top: 4),
                      child: Text(
                        "${model.data[index].degree}, ${model.data[index].area}",
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
                            model.data[index].period,
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
                    Padding(
                      padding: defaultPadding,
                      child: Text(
                        model.data[index].programm,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    ...model.data[index].courses
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
