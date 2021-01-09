import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/blocs/locale/locale_cubit.dart';
import 'package:resume/blocs/theme/theme_cubit.dart';
import 'package:resume/models/models.dart';
import 'package:resume/utils/asset_reader.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    final localeCubit = BlocProvider.of<LocaleCubit>(context);

    return Scaffold(
      body: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          return FutureBuilder<ResumeModel>(
              future: AssetReader.read(
                  'assets/resumes/resume_${state.locale.toShortString()}.md'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final model = snapshot.data;
                  return NestedScrollView(
                    headerSliverBuilder: (context, scrolled) {
                      return <Widget>[
                        SliverAppBar(
                          elevation: 0,
                          expandedHeight: 300,
                          floating: false,
                          pinned: true,
                          actions: [
                            IconButton(
                              icon: Icon(Icons.nights_stay),
                              onPressed: () => themeCubit.switchTheme(),
                            )
                          ],
                          leading: IconButton(
                            icon: Icon(Icons.language),
                            onPressed: () => localeCubit.switchLocale(),
                          ),
                          flexibleSpace: FlexibleSpaceBar(
                            centerTitle: true,
                            title: Text(model.name),
                            background: Image.asset(
                              'assets/images/profile.jpg',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        )
                      ];
                    },
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            child: ListTile(
                              title: Text(model.position),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(model.phoneNumber),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(model.description),
                            ),
                          ),
                          ...List<Widget>.generate(model.links.length, (index) {
                            final el = model.links[index];
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
                          ...List<Widget>.generate(
                            model.languages.length,
                            (index) => Card(
                              child: ListTile(
                                title: Text(model.languages[index].title),
                                subtitle: Text(
                                    "${model.languages[index].value} / ${model.languages[index].maxValue}"),
                              ),
                            ),
                          ),
                          ...List<Widget>.generate(
                            model.skills.length,
                            (index) => Card(
                              child: ListTile(
                                title: Text(model.skills[index].title),
                                subtitle: Text(
                                    "${model.skills[index].value} / ${model.skills[index].maxValue}"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              });
        },
      ),
    );
  }
}
