import 'package:_app_framework/services/app_settings_service.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  final AppSettingsService appSettingsService = AppSettingsService ();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            appSettingsService.appIcon,
            const SizedBox(height: 64),
            Text(
              appSettingsService.appName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 32),
            Text(
              'by ${appSettingsService.author}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 32),
            Text(
              'Available at: ${appSettingsService.appUrl}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}