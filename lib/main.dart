/* TO DO

  - Add logging
  - Add a sample web api caller/service
  - Turn About Icon into a Hamburger

  - Create PWA_framework branch
  - Add Web App capability
 
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/home/home_page.dart';
import 'app/material_app_builder.dart';
import 'services/app_settings_service.dart';
import 'services/color_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
   const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppSettingsService>(
          create: (_) => AppSettingsService(),
        ),
        Provider<ColorService>(
          create: (_) => ColorService(),
        )
      ],
      child: MaterialAppBuilder(builder: (context) {
        final colorService = Provider.of<ColorService>(context, listen: false);

        return MaterialApp(
          theme: ThemeData(primarySwatch: MaterialColor(0xFF2196F3, colorService.colorSwatchShades)),
          home: const HomePage()
        );
      }),
    );
  }
}
