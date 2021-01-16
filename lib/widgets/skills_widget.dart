import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/blocs/theme/theme_cubit.dart';
import 'package:resume/blocs/theme/theme_cubit.dart';
import 'package:resume/models/models.dart';

import 'section_title_text.dart';

const ICONS_MAP = <String, IconData>{
  'github': FontAwesomeIcons.github,
  'gitlab': FontAwesomeIcons.gitlab,
  'git': FontAwesomeIcons.git,
  'docker': FontAwesomeIcons.docker,
  'linux': FontAwesomeIcons.linux,
  'python': FontAwesomeIcons.python,
  'javascript': FontAwesomeIcons.js,
  'fire': FontAwesomeIcons.fire,
};

class SkillsWidget extends StatelessWidget {
  final Skills model;
  const SkillsWidget({Key key, this.model}) : super(key: key);

  Widget buildIcon(Skill skill) {
    for (final element in ICONS_MAP.entries) {
      if (skill.title.toLowerCase().contains(element.key)) {
        return FaIcon(element.value);
      }
    }
    return FaIcon(FontAwesomeIcons.cog);
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return Column(
      children: [
        SectionTitleText(
          model.title ?? "Skills",
        ),
        Card(
          child: Column(
            children: List<Widget>.generate(
              model.data.length,
              (index) => ListTile(
                title: Text(model.data[index].title),
                subtitle: Row(
                  children: List.generate(
                    model.data[index].value,
                    (_index) => Icon(
                      Icons.star,
                      size: 14,
                      color: ((themeCubit.state.theme == AppTheme.dark)
                              ? Theme.of(context).textTheme.bodyText1.color
                              : Theme.of(context).primaryColor)
                          .withOpacity(model.data[index].value /
                              model.data[index].maxValue),
                    ),
                  ),
                ),
                leading:
                    (model.data[index].title.toLowerCase().contains('flutter'))
                        ? FlutterLogo()
                        : buildIcon(model.data[index]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
