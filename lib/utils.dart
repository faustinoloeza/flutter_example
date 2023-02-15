import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

String detectPlatform() {
  String os = 'Unknown';
  if (kIsWeb) {
    return "Web";
  } else {
    os = Platform.operatingSystem.toString();
  }

  return os;
}
