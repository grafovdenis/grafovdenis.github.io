import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/blocs/theme/theme_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  icon: Icon(Icons.nights_stay),
                  onPressed: () =>
                      BlocProvider.of<ThemeCubit>(context).switchTheme(),
                  color: (Theme.of(context).brightness == Brightness.light)
                      ? Colors.black
                      : Colors.white,
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Denis Grafov"),
                background: Image.asset(
                  'assets/images/profile.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          ];
        },
        body: Container(),
      ),
    );
  }
}
