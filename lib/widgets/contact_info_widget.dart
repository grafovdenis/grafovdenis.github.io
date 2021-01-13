import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

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
          Text(
            model.title ?? "Links",
            style: Theme.of(context).textTheme.headline4,
          ),
          if (model.location != null)
            Card(
              child: ListTile(
                title: Text(model.location),
                leading: FaIcon(FontAwesomeIcons.mapMarkerAlt),
              ),
            ),
          if (model.email != null)
            Card(
              child: ListTile(
                title: Text(model.email),
                leading: FaIcon(FontAwesomeIcons.solidEnvelope),
                onTap: () {
                  launch('mailto:${model.email}');
                },
              ),
            ),
          if (model.phoneNumber != null)
            Card(
              child: ListTile(
                title: Text(model.phoneNumber),
                leading: FaIcon(FontAwesomeIcons.phone),
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
