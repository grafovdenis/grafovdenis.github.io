class ResumeModel {
  final String name;
  final String position;
  final String phoneNumber;
  final String description;
  final List<Link> links;
  final List<Skill> languages;
  final List<Skill> skills;
  final Experience experience;
  final Education education;

  const ResumeModel({
    this.name,
    this.position,
    this.phoneNumber,
    this.description,
    this.links,
    this.languages,
    this.skills,
    this.experience,
    this.education,
  });
}

abstract class Section<T> {
  final String title;
  final T data;

  const Section({this.title, this.data});
}

class Link {
  final String title;
  final String url;

  const Link({this.title, this.url});

  @override
  String toString() {
    return '{"title": $title, "url": $url}';
  }

  factory Link.fromString(String string) {
    final titleStart = string.indexOf('[');
    final titleEnd = string.indexOf(']');

    final urlStart = string.indexOf('(');
    final urlEnd = string.indexOf(')');

    return Link(
      title: string.substring(titleStart + 1, titleEnd),
      url: string.substring(urlStart + 1, urlEnd),
    );
  }
}

class Skill {
  final String title;
  final String strValue;
  final int value;
  final int maxValue;

  const Skill({this.title, this.strValue, this.value, this.maxValue});

  factory Skill.fromString(String string) {
    return Skill(
      title: string.split(" ").sublist(1).join(" "),
      strValue: string.split(" ").first,
      value: '★'.allMatches(string).length,
      maxValue: string.split(" ").first.length,
    );
  }
}

class Experience extends Section {
  final List<Job> jobs;

  const Experience({String title, this.jobs}) : super(title: title);
}

class Job {
  final String title;
  final String location;
  final String interval;
  final String subtitle;
  final List<String> areasOfResponsibility;

  const Job({
    this.title,
    this.location,
    this.interval,
    this.subtitle,
    this.areasOfResponsibility,
  });
}

class Education extends Section {
  final String place;
  final String area;
  final DateTime start;
  final DateTime end;
  final String programm;
  final List<String> courses;

  const Education({
    String title,
    this.place,
    this.area,
    this.start,
    this.end,
    this.programm,
    this.courses,
  }) : super(title: title);
}
