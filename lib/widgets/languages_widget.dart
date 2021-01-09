import 'package:flutter/material.dart';
import 'package:resume/models/models.dart';

class LanguagesWidget extends StatelessWidget {
  final List<Skill> model;
  const LanguagesWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: List<Widget>.generate(
          model.length,
          (index) => Card(
            child: ListTile(
              title: Text(model[index].title),
              subtitle:
                  Text("${model[index].value} / ${model[index].maxValue}"),
            ),
          ),
        ),
      ),
    );
  }
}
