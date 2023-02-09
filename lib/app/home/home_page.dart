import 'dart:async';
import 'package:flutter/material.dart';
import '../../services/app_settings_service.dart';
import 'about_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AppSettingsService appSettingsService = AppSettingsService ();

  Future<void> _onAbout(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true, 
        builder: (_) => AboutPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appSettingsService.appName),
        leading: appSettingsService.appIconSmall,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.help //Icons.more_vert,
            ),
            onPressed: () {
              _onAbout(context);
            },
          )
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

