import 'package:flutter/services.dart' show rootBundle;
import 'package:resume/blocs/locale/locale_cubit.dart';

class RawResume {
  final String file;
  final List<String> strings;

  const RawResume({this.file, this.strings});
}

class AssetReader {
  static Future<RawResume> read(AppLocale locale) async {
    final file = await rootBundle
        .loadString('assets/resumes/resume_${locale.toShortString()}.md');
    final strings = file.split('\n');

    return RawResume(file: file, strings: strings);
  }
}
