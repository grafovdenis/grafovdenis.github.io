import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/blocs/theme/theme_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.nights_stay),
            onPressed: () => BlocProvider.of<ThemeCubit>(context).switchTheme(),
          )
        ],
      ),
    );
  }
}
