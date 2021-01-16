import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/theme/theme_cubit.dart';
import 'blocs/locale/locale_cubit.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeCubit>(
        create: (_) {
          final brightness =
              SchedulerBinding.instance.window.platformBrightness;
          return ThemeCubit(
            brightness == Brightness.light ? AppTheme.light : AppTheme.dark,
          );
        },
      ),
      BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Denis Grafov',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData.dark(),
          themeMode:
              (state.theme == AppTheme.dark) ? ThemeMode.dark : ThemeMode.light,
          home: HomePage(),
        );
      },
    );
  }
}
