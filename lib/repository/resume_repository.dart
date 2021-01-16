import 'package:resume/blocs/locale/locale_cubit.dart';
import 'package:resume/models/models.dart';
import 'package:resume/utils/asset_reader.dart';

class ResumeRepository {
  static Future<ResumeModel> getResume(AppLocale locale) async {
    final raw = await AssetReader.read(locale);
    final strings = raw.strings;

    final name = strings
        .firstWhere((element) => element.startsWith('#'))
        .replaceFirst('# ', '');
    final position = strings
        .firstWhere((element) => element.startsWith('###'))
        .replaceFirst('### ', '');

    final sectionExp = RegExp(r"^\#{2}[^#].+$");
    final subSectionExp = RegExp(r"^\#{3}[^#].+");
    final subSubSectionExp = RegExp(r"^\#{4}[^#].+");

    final sectionsIndexes = <int>[];

    strings.asMap().forEach((index, element) {
      if (sectionExp.hasMatch(element)) {
        sectionsIndexes.add(index);
      }
    });

    final Map<String, List<String>> sections = {};

    for (int i = 0; i < sectionsIndexes.length - 1; i++) {
      final sectionStartIndex = sectionsIndexes[i];
      final sectionEndIndex = sectionsIndexes[i + 1] - 1;
      sections.putIfAbsent(strings[sectionStartIndex].replaceFirst("## ", ""),
          () => strings.sublist(sectionStartIndex + 1, sectionEndIndex));
    }

    sections.putIfAbsent(strings[sectionsIndexes.last].replaceFirst("## ", ""),
        () => strings.sublist(sectionsIndexes.last + 1));

    final sectionList = sections.values.toList();
    final sectionTitles = sections.keys.toList();

    /// let contact info be first section
    final _contactInfo = sectionList.first;
    final telephoneRegExp = RegExp(r"[\+\d+]+");
    final emailRegExp = RegExp(r"mailto:[^\)]+");

    String _telephone;
    String _email;
    String _location;

    _contactInfo.forEach((element) {
      if (element.contains(telephoneRegExp)) {
        _telephone = telephoneRegExp.firstMatch(element).group(0);
      } else if (element.contains(emailRegExp)) {
        _email = emailRegExp
            .firstMatch(element)
            .group(0)
            .replaceFirst("mailto:", "");
      } else {
        _location = element;
      }
    });

    final contactInfo = ContactInfo(
      title: sectionTitles.first,
      location: _location,
      phoneNumber: _telephone,
      email: _email,
    );

    final summary = sectionList[1].join("\n");

    final links = sectionList[2].map((e) => Link.fromString(e)).toList();

    final languages =
        sectionList[3].map((e) => Skill.fromString(e.trim())).toList();

    final skills =
        sectionList[4].map((e) => Skill.fromString(e.trim())).toList();

    final _experience = sectionList[5];

    final List<int> jobsIndexes = [];

    _experience.asMap().forEach((key, value) {
      if (subSectionExp.hasMatch(value)) {
        jobsIndexes.add(key);
      }
    });

    final Map<String, List<String>> _jobs = {};

    for (int i = 0; i < jobsIndexes.length - 1; i++) {
      final jobStartIndex = jobsIndexes[i];
      final jobEndIndex = jobsIndexes[i + 1] - 1;
      _jobs.putIfAbsent(_experience[jobStartIndex].replaceFirst("### ", ""),
          () => _experience.sublist(jobStartIndex + 1, jobEndIndex));
    }

    _jobs.putIfAbsent(_experience[jobsIndexes.last].replaceFirst("### ", ""),
        () => _experience.sublist(jobsIndexes.last + 1));

    final jobs = _jobs.entries.map((_job) {
      final String period = _job.value.first.replaceFirst("* ", "");
      final subtitle = _job.value[1].replaceFirst("* ", "");

      int description;
      _job.value.asMap().forEach((i, element) {
        if (subSubSectionExp.hasMatch(element)) {
          description = i + 1;
        }
      });

      return Job(
        title: _job.key,
        subtitle: subtitle,
        interval: period,
        description: _job.value.sublist(description),
      );
    }).toList();

    final _education = sectionList[6];

    final List<int> educationIndexes = [];

    _education.asMap().forEach((key, value) {
      if (subSectionExp.hasMatch(value)) {
        educationIndexes.add(key);
      }
    });

    final Map<String, List<String>> _educationItems = {};

    for (int i = 0; i < educationIndexes.length - 1; i++) {
      final itemStartIndex = educationIndexes[i];
      final itemEndIndex = educationIndexes[i + 1] - 1;
      _educationItems.putIfAbsent(
          _education[itemStartIndex].replaceFirst("### ", ""),
          () => _education.sublist(itemStartIndex + 1, itemEndIndex));
    }

    _educationItems.putIfAbsent(
      _education[educationIndexes.last].replaceFirst("### ", ""),
      () => _education.sublist(educationIndexes.last + 1),
    );

    final educationItems = _educationItems.entries.map((_eduItem) {
      final area = _eduItem.value.first.replaceFirst("#### ", "");
      final degree = _eduItem.value[1].replaceFirst("* ", "");
      final period = _eduItem.value[2].replaceFirst("* ", "");
      final program = _eduItem.value[3].replaceFirst("* ", "");

      int coursesIndex;
      _eduItem.value.asMap().forEach((i, element) {
        if (subSubSectionExp.hasMatch(element)) {
          coursesIndex = i + 1;
        }
      });

      return EducationItem(
        place: _eduItem.key,
        area: area,
        period: period,
        degree: degree,
        programm: program,
        courses: _eduItem.value.sublist(coursesIndex),
      );
    }).toList();

    return ResumeModel(
      name: name,
      position: position,
      contactInfo: contactInfo,
      summary: summary,
      links: Links(title: sectionTitles[2], data: links),
      languages: Languages(title: sectionTitles[3], data: languages),
      skills: Skills(title: sectionTitles[4], data: skills),
      experience: Experience(title: sectionTitles[5], jobs: jobs),
      education: Education(title: sectionTitles[6], data: educationItems),
    );
  }
}
