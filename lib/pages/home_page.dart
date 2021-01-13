import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/blocs/locale/locale_cubit.dart';
import 'package:resume/blocs/theme/theme_cubit.dart';
import 'package:resume/models/models.dart';
import 'package:resume/repository/resume_repository.dart';
import 'package:resume/utils/asset_reader.dart';
import 'package:resume/utils/scaffold_utils.dart';
import 'package:resume/widgets/contact_info_widget.dart';
import 'package:resume/widgets/education_widget.dart';
import 'package:resume/widgets/experience_widget.dart';
import 'package:resume/widgets/languages_widget.dart';
import 'package:resume/widgets/links_widget.dart';
import 'package:resume/widgets/skills_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    final localeCubit = BlocProvider.of<LocaleCubit>(context);

    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return FutureBuilder<ResumeModel>(
          future: ResumeRepository.getResume(state.locale),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final model = snapshot.data;
              return Scaffold(
                drawer: SkillsWidget(
                  model: model.skills.data,
                  title: model.skills.title,
                ),
                body: NestedScrollView(
                  headerSliverBuilder: (context, scrolled) {
                    return <Widget>[
                      SliverAppBar(
                        elevation: 0,
                        expandedHeight: 300,
                        floating: false,
                        pinned: true,
                        actions: [
                          IconButton(
                            icon: Icon(Icons.language),
                            onPressed: () => localeCubit.switchLocale(),
                          ),
                          IconButton(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            icon: Icon(Icons.nights_stay),
                            onPressed: () => themeCubit.switchTheme(),
                          ),
                        ],
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          titlePadding: const EdgeInsets.all(8),
                          title: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(model.name),
                              Text(
                                model.position,
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          background: Padding(
                            padding: const EdgeInsets.all(32),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/profile.jpg',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      )
                    ];
                  },
                  body: SingleChildScrollView(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        ContactInfoWidget(model: model.contactInfo),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            model.summary,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        LinksWidget(model: model.links),
                        LanguagesWidget(model: model.languages),
                        ExperienceWidget(model: model.experience),
                        EducationWidget(model: model.education),
                      ],
                    ),
                  ),
                ),
              ).asResponsive();
            } else {
              return Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
          },
        );
      },
    );
  }
}
