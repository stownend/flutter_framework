import 'dart:async';
import 'package:_app_framework/app/TestPages/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/app_settings_service.dart';
import 'about_page.dart';

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

  Future<void> _onRequestedRestApi(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true, 
        builder: (_) => const RestApi(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appSettingsService = Provider.of<AppSettingsService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(appSettingsService.appName),
        actions: <Widget>[
         IconButton(
            icon: const Icon(
            Icons.person_2,
              size: 32,
            ),
            onPressed: () {
              _onAbout(context);
            },
          ),
          
        ],
        //bottom: PreferredSize(
          //preferredSize: const Size.fromHeight(130.0),
          // child: Column(
          //   children: <Widget>[
          //     _buildUserInfo(context: context),
          //     const SizedBox(height: 16),
          //   ],
          // ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 64.0,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: TextButton(
                    style: const ButtonStyle(
                      alignment: Alignment.centerLeft, // <-- had to set alignment
                    ),
                    child: const Text("Quick Access", 
                      style: TextStyle(color: Colors.white)
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              ListTile(
                title: const Text('Test a REST API call'),
                onTap: () {
                  Navigator.pop(context);
                  _onRequestedRestApi(context);
                },
              ),
              ListTile(
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  _onAbout(context);
                },
              ),
            ]
          )
        ),
      );
  }

}

