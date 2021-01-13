import 'package:flutter/material.dart';
import 'package:resume/models/models.dart';

class SkillsWidget extends StatelessWidget {
  final String title;
  final List<Skill> model;
  const SkillsWidget({Key key, this.title, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  title ?? "Skills",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            ...List<Widget>.generate(
              model.length,
              (index) => ListTile(
                title: Text(model[index].title),
                subtitle: Text("${model[index].strValue}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
