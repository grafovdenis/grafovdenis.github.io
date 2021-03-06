import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

import 'section_title_text.dart';

class LinksWidget extends StatelessWidget {
  final Links model;

  const LinksWidget({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SectionTitleText(model.title ?? "Links"),
          ...List<Widget>.generate(
            model.data.length,
            (index) {
              final el = model.data[index];
              IconData icon;
              switch (el.title.toLowerCase()) {
                case "github":
                  icon = FontAwesomeIcons.github;
                  break;
                case "linkedin":
                  icon = FontAwesomeIcons.linkedin;
                  break;
                default:
                  icon = FontAwesomeIcons.link;
              }
              return Card(
                child: ListTile(
                  title: Text(el.url.split('/').last),
                  leading: FaIcon(icon),
                  onTap: () {
                    launch(el.url);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
