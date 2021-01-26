import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:resume/blocs/locale/locale_cubit.dart';

class RawResume {
  final List<String> strings;

  const RawResume({this.strings});
}

class AssetReader {
  static Future<RawResume> read(AppLocale locale) async {
    final file = await compute(rootBundle.loadString,
        'assets/resumes/resume_${locale.toShortString()}.md');
    final strings = file.split('\n');

    return RawResume(strings: strings);
  }
}
