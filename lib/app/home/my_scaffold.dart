import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/app_settings_service.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;

  const MyScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final appSettingsService = Provider.of<AppSettingsService>(context, listen: false);
    
    return Scaffold(

      appBar: AppBar(
        title: Text(appSettingsService.appName),
        actions: <Widget>[
          PopupMenuButton(
          // add icon, by default "3 dot" icon
          // icon: Icon(Icons.book)
          itemBuilder: (context){
            return [
                  const PopupMenuItem<int>(
                      value: 0,
                      child: Text("Home"),
                  ),

                  const PopupMenuItem<int>(
                      value: 1,
                      child: Text("Test Rest API"),
                  ),

                  const PopupMenuItem<int>(
                      value: 2,
                      child: Text("About"),
                  ),
              ];
          },
          onSelected:(value){
            if(value == 0){
                Navigator.pushNamed(context, "/home");
            }else if(value == 1){
                Navigator.pushNamed(context, "/testRestAPI");
            }else if(value == 2){
                Navigator.pushNamed(context, "/about");
            }
          }
        ),
/*
         IconButton(
            icon: const Icon(
            Icons.person_2,
              size: 32,
            ),
            onPressed: () {
              //_onAbout(context);
            },
          ),
*/          
        ],
      ),

/*
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
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/home");
                },
              ),
              ListTile(
                title: const Text('Test a REST API call'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/testRestAPI");
                },
              ),
              ListTile(
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/about");
                },
              ),
            ]
          )
      ),
      */
      body: body
    );
  }
}