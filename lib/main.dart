/* TO DO

  - Add to GitHub
  - Test copy/rename
  - Add MultiProvider and use for appSettings and color services
  - Add a sample web api caller/service
  - Turn About Icon into a Hamburger
  - Add custom Icon

  - Create PWA_framework branch
  - Add Web App capability
 
*/

import 'package:_app_framework/services/color_service.dart';
import 'package:flutter/material.dart';

import 'app/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final colorService = ColorService();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: MaterialColor(0xFF2196F3, colorService.colorSwatchShades)),
      home: HomePage(),
    );
  }
}
