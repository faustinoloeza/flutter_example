import 'dart:html';
import 'dart:io' as myDart show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

String detectPlatform() {
  String os = 'Unknown';
  if (kIsWeb) {
    return "Web";
  } else {
    os = myDart.Platform.operatingSystem;
  }
  return os;
}

String getOSInsideWeb() {
  final userAgent = window.navigator.userAgent.toString().toLowerCase();
  if (userAgent.contains("iphone")) return "ios";
  if (userAgent.contains("ipad")) return "ios";
  if (userAgent.contains("android")) return "Android";
  return userAgent.toString();
}
