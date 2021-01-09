import 'package:flutter/material.dart';
import 'package:resume/models/models.dart';

class ExperienceWidget extends StatelessWidget {
  final Experience model;
  const ExperienceWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: List<Widget>.generate(
          model.jobs.length,
          (index) => Card(
            child: ListTile(
              title: Text(model.jobs[index].title),
              subtitle: Column(
                children: [
                  Text(model.jobs[index].subtitle),
                  Text(model.jobs[index].interval),
                  ...model.jobs[index].areasOfResponsibility
                      .map((e) => Text(e))
                      .toList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
