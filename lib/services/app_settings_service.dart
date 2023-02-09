import 'package:flutter/material.dart';

class AppSettingsService {
  
  final String appName = "Skeletal App";
  final String author = "Steve Townend";
  final String appUrl = "https//skeletal.app.com";
  static const IconData iconData = Icons.webhook_sharp;
  
  final Icon appIcon = const Icon(iconData, size: 64);  
  final Icon appIconSmall = const Icon(iconData, size: 32);
}