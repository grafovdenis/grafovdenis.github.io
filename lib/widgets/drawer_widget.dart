import 'package:flutter/material.dart';
import 'package:resume/models/models.dart';

import 'contact_info_widget.dart';
import 'links_widget.dart';

class DrawerWidget extends StatelessWidget {
  final ResumeModel model;
  const DrawerWidget({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: AppBar().preferredSize.height),
              ContactInfoWidget(model: model.contactInfo),
              LinksWidget(model: model.links),
            ],
          ),
        ),
      ),
    );
  }
}
