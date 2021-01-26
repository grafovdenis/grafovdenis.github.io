import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/models/models.dart';

class BackgroundWidget extends StatelessWidget {
  final ResumeModel model;
  const BackgroundWidget({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16) + const EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(8),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    model.position,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.mapMarkerAlt,
                        color: Colors.white.withOpacity(0.75),
                      ),
                      SizedBox(width: 8),
                      Text(
                        model.contactInfo.location,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.white.withOpacity(0.75)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
