import 'dart:developer';

import 'package:flutter/services.dart' show rootBundle;

class AssetReader {
  static void read(String path) async {
    final file = await rootBundle.loadString(path);
    final strings = file.split('\n');
    log(file);
    print(strings.length);
  }
}
