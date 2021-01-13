import 'package:flutter/foundation.dart';

class ResumeModel {
  final String name;
  final String position;
  final ContactInfo contactInfo;
  final String summary;
  final Links links;
  final Languages languages;
  final Skills skills;
  final Experience experience;
  final Education education;

  const ResumeModel({
    this.name,
    this.position,
    this.contactInfo,
    this.summary,
    this.links,
    this.languages,
    this.skills,
    this.experience,
    this.education,
  });
}

abstract class Section {
  final String title;

  const Section({this.title});
}

class ContactInfo extends Section {
  final String location;
  final String phoneNumber;
  final String email;

  const ContactInfo({
    String title,
    this.location,
    this.phoneNumber,
    this.email,
  }) : super(title: title);
}

class Links extends Section {
  final List<Link> data;

  const Links({String title, this.data}) : super(title: title);
}

class Languages extends Section {
  final List<Skill> data;

  const Languages({String title, this.data}) : super(title: title);
}

class Skills extends Section {
  final List<Skill> data;

  const Skills({String title, this.data}) : super(title: title);
}

class Experience extends Section {
  final List<Job> jobs;

  const Experience({String title, this.jobs}) : super(title: title);
}

class Education extends Section {
  final List<EducationItem> data;

  const Education({String title, this.data}) : super(title: title);
}

class EducationItem {
  final String place;
  final String area;
  final String period;
  final String degree;
  final String programm;
  final List<String> courses;

  const EducationItem({
    @required this.place,
    @required this.area,
    @required this.period,
    @required this.degree,
    @required this.programm,
    @required this.courses,
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

  @override
  String toString() {
    return {
      "title": title,
      "strValue": strValue,
      "value": value,
      "maxValue": maxValue,
    }.toString();
  }
}

class Job {
  final String title;
  final String location;
  final String interval;
  final String subtitle;
  final List<String> description;

  const Job({
    this.title,
    this.location,
    this.interval,
    this.subtitle,
    this.description,
  });
}
