import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/models/models.dart';

class LinksWidget extends StatelessWidget {
  final List<Link> model;
  const LinksWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: List<Widget>.generate(model.length, (index) {
          final el = model[index];
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
              title: Text(el.url),
              leading: FaIcon(icon),
            ),
          );
        }),
      ),
    );
  }
}
