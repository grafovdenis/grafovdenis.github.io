import 'package:flutter/material.dart';
import 'package:resume/models/models.dart';

class SkillsWidget extends StatelessWidget {
  final List<Skill> model;
  const SkillsWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: List<Widget>.generate(
          model.length,
          (index) => ListTile(
            title: Text(model[index].title),
            subtitle:
                Text("${model[index].value} / ${model[index].maxValue}"),
          ),
        ),
      ),
    );
  }
}
