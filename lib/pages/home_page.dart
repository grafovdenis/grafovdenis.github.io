import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/blocs/locale/locale_cubit.dart';
import 'package:resume/blocs/theme/theme_cubit.dart';
import 'package:resume/models/models.dart';
import 'package:resume/repository/resume_repository.dart';
import 'package:resume/utils/scaffold_utils.dart';
import 'package:resume/widgets/background_widget.dart';
import 'package:resume/widgets/drawer_widget.dart';
import 'package:resume/widgets/education_widget.dart';
import 'package:resume/widgets/experience_widget.dart';
import 'package:resume/widgets/languages_widget.dart';
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
          future: compute(ResumeRepository.getResume, state.locale),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final model = snapshot.data;
              return Scaffold(
                drawer: DrawerWidget(model: model),
                body: Builder(builder: (context) {
                  return NestedScrollView(
                    headerSliverBuilder: (context, scrolled) {
                      return <Widget>[
                        SliverAppBar(
                          elevation: 0,
                          expandedHeight:
                              (MediaQuery.of(context).size.width / 2 <= 250)
                                  ? MediaQuery.of(context).size.width / 2
                                  : 250,
                          floating: false,
                          pinned: true,
                          // leading: Builder(
                          //   builder: (BuildContext context) {
                          //     return IconButton(
                          //       icon: const Icon(FontAwesomeIcons.addressCard),
                          //       onPressed: () {
                          //         Scaffold.of(context).openDrawer();
                          //       },
                          //       tooltip: MaterialLocalizations.of(context)
                          //           .openAppDrawerTooltip,
                          //     );
                          //   },
                          // ),
                          actions: [
                            IconButton(
                              icon: Icon(Icons.language),
                              onPressed: () => localeCubit.switchLocale(),
                              tooltip: "Switch language",
                            ),
                            IconButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              icon: Icon(Icons.nights_stay),
                              onPressed: () => themeCubit.switchTheme(),
                              tooltip: "Switch theme",
                            ),
                          ],
                          flexibleSpace: FlexibleSpaceBar(
                            centerTitle: true,
                            titlePadding: const EdgeInsets.all(8),
                            title: (scrolled)
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(model.name),
                                      Text(
                                        model.position,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  )
                                : Container(),
                            background: BackgroundWidget(model: model),
                          ),
                        )
                      ];
                    },
                    body: SingleChildScrollView(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                model.summary,
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SkillsWidget(model: model.skills),
                          LanguagesWidget(model: model.languages),
                          ExperienceWidget(model: model.experience),
                          EducationWidget(model: model.education),
                        ],
                      ),
                    ),
                  );
                }),
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
