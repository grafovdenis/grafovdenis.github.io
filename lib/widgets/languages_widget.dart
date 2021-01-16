import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/blocs/theme/theme_cubit.dart';
import 'package:resume/models/models.dart';

import 'section_title_text.dart';

class LanguagesWidget extends StatelessWidget {
  final Languages model;
  const LanguagesWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return Container(
      child: Column(
        children: [
          SectionTitleText(model.title ?? "Languages"),
          ...List<Widget>.generate(
            model.data.length,
            (index) => Card(
              child: ListTile(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
