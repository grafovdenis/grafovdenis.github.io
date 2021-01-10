import 'package:flutter/material.dart';
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
                    child: Text(
                      model.jobs[index].interval,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ...model.jobs[index].areasOfResponsibility
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(e, textAlign: TextAlign.start),
                          ))
                      .toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
