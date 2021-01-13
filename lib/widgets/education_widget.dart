import 'package:flutter/material.dart';
import 'package:resume/models/models.dart';

class EducationWidget extends StatelessWidget {
  final Education model;
  const EducationWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            model.title ?? "Education",
            style: Theme.of(context).textTheme.headline4,
          ),
          ...List<Widget>.generate(
            model.data.length,
            (index) => Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(model.data[index].place),
                    subtitle: Text(
                      "${model.data[index].degree}, ${model.data[index].area}",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      model.data[index].programm,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      model.data[index].area,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      model.data[index].period,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ...model.data[index].courses
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
