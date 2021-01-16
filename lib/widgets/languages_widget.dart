import 'package:flutter/material.dart';
import 'package:resume/models/models.dart';

import 'section_title_text.dart';

class LanguagesWidget extends StatelessWidget {
  final Languages model;
  const LanguagesWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SectionTitleText(model.title ?? "Languages"),
          ...List<Widget>.generate(
            model.data.length,
            (index) => Card(
              child: ListTile(
                title: Text(model.data[index].title),
                subtitle: Text(
                    "${model.data[index].value} / ${model.data[index].maxValue}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
