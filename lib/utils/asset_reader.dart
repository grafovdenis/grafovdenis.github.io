import 'package:flutter/services.dart' show rootBundle;
import 'package:resume/models/models.dart';

class AssetReader {
  static Future<ResumeModel> read(String path) async {
    final file = await rootBundle.loadString(path);
    final strings = file.split('\n');
    final name = strings
        .firstWhere((element) => element.startsWith('#'))
        .replaceFirst('# ', '');
    final position = strings
        .firstWhere((element) => element.startsWith('###'))
        .replaceFirst('### ', '');

    final telephoneExp = RegExp(r"(\[.+]\(tel:.+)");
    final telephone = strings
        .firstWhere((element) => telephoneExp.hasMatch(element))
        .split('tel:')[1]
        .replaceAll(")", "");

    final sectionExp = RegExp(r"^\#{2}[a-zA-Zа-яА-Я\s]+$");

    final sections = strings.where((element) => sectionExp.hasMatch(element));

    final List<int> sectionsIndexes = [];

    sections.forEach((element) {
      sectionsIndexes.add(strings.indexOf(element));
    });

    final description =
        strings.sublist(sectionsIndexes[0] + 1, sectionsIndexes[1] - 1);

    final links =
        strings.sublist(sectionsIndexes[1] + 1, sectionsIndexes[2] - 1);

    final List<Link> _links = [];

    links.forEach((element) {
      _links.add(Link.fromString(element));
    });

    final languages =
        strings.sublist(sectionsIndexes[2] + 1, sectionsIndexes[3] - 1)
        .map((e) => e.trim())
        .toList();

    print(languages);

    final List<Skill> _languages = [];

    languages.forEach((element) {
      _languages.add(Skill.fromString(element));
    });

    final skills = strings
        .sublist(sectionsIndexes[3] + 1, sectionsIndexes[4] - 1)
        .map((e) => e.trim())
        .toList();

    final List<Skill> _skills = [];

    skills.forEach((element) {
      _skills.add(Skill.fromString(element));
    });

    return ResumeModel(
      name: name,
      position: position,
      phoneNumber: telephone,
      description: description.join("\n"),
      links: _links,
      languages: _languages,
      skills: _skills,
    );
  }
}
