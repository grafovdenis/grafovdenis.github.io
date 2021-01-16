import 'package:flutter/material.dart';
import 'package:resume/models/models.dart';

import 'section_title_text.dart';

class EducationWidget extends StatelessWidget {
  final Education model;
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      model.data[index].place,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${model.data[index].degree}, ${model.data[index].area}",
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
                          model.data[index].period,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16) +
                        const EdgeInsets.only(bottom: 8),
                    child: Text(
                      model.data[index].area,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16) +
                        const EdgeInsets.only(bottom: 16),
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
        ],
      ),
    );
  }
}
