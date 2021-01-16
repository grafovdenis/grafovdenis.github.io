import 'package:flutter/material.dart';
import 'package:resume/models/models.dart';

class SectionWidget<T extends Section> extends StatelessWidget {
  final String title;
  final T data;
  const SectionWidget({Key key, this.title, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
