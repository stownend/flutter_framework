import 'package:flutter/material.dart';

class AppSettingsService {
  
  final String appName = "Skeletal App";
  final String author = "Steve Townend";
  final String appUrl = "https//skeletal.app.com";
  final String appLogo = "images/icon.png";

  // Icon not used at present, prefer appLogo image
  static const IconData iconData = Icons.person_2;
  final Icon appIcon = const Icon(iconData, size: 64);  
  final Icon appIconSmall = const Icon(iconData, size: 32);
}
