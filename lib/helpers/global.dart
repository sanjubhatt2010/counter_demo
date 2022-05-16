import 'package:flutter/foundation.dart';

printDebug(text, {String header = ''}) {
  if (kDebugMode) print('$header: $text');
}
