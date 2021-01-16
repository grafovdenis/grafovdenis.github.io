import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

import 'section_title_text.dart';

class ContactInfoWidget extends StatelessWidget {
  final ContactInfo model;

  const ContactInfoWidget({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SectionTitleText(model.title ?? "Contact info"),
          if (model.email != null)
            Card(
              child: ListTile(
                title: Text(model.email),
                leading: Icon(Icons.mail),
                onTap: () {
                  launch('mailto:${model.email}');
                },
              ),
            ),
          if (model.phoneNumber != null)
            Card(
              child: ListTile(
                title: Text(model.phoneNumber),
                leading: Icon(Icons.call),
                onTap: () {
                  launch('tel:${model.phoneNumber}');
                },
              ),
            ),
        ],
      ),
    );
  }
}
