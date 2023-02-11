import 'dart:async';
import 'package:_app_framework/services/app_settings_service.dart';
import 'package:flutter/material.dart';
import 'about_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _onAbout(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true, 
        builder: (_) => const AboutPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appSettingsService = Provider.of<AppSettingsService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(appSettingsService.appName),
        leading: IconButton(
            icon: const Icon(
              Icons.help //Icons.more_vert,
            ),
            onPressed: () {
              _onAbout(context);
            },
          ),
        actions: <Widget>[
          appSettingsService.appIconSmall,
        ],
        // actions: <Widget>[],
        //bottom: PreferredSize(
          //preferredSize: const Size.fromHeight(130.0),
          // child: Column(
          //   children: <Widget>[
          //     _buildUserInfo(context: context),
          //     const SizedBox(height: 16),
          //   ],
          // ),
        ),
      );
  }

}

