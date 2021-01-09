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
  final int value;
  final int maxValue;

  const Skill({this.title, this.value, this.maxValue});

  factory Skill.fromString(String string) {
    return Skill(
      title: string.split(" ").sublist(1).join(" "),
      value: '★'.allMatches(string).length,
      maxValue: string.split(" ").first.length,
    );
  }
}

class Experience {
  final List<Job> jobs;

  const Experience({this.jobs});
}

class Job {
  final String title;
  final String location;
  final DateTime start;
  final DateTime end;
  final String subtitle;
  final List<String> areasOfResponsibility;

  const Job({
    this.title,
    this.location,
    this.start,
    this.end,
    this.subtitle,
    this.areasOfResponsibility,
  });
}

class Education {
  final String place;
  final String area;
  final DateTime start;
  final DateTime end;
  final String programm;
  final List<String> courses;

  const Education({
    this.place,
    this.area,
    this.start,
    this.end,
    this.programm,
    this.courses,
  });
}
