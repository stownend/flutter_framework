import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/app_settings_service.dart';
import '../../services/color_service.dart';

class MyScaffold extends StatelessWidget {

  const MyScaffold({super.key, required this.body, this.navIndex});
  final Widget body;
  final int? navIndex;

  @override
  Widget build(BuildContext context) {
    final appSettingsService = Provider.of<AppSettingsService>(context, listen: false);
    final colorService = Provider.of<ColorService>(context, listen: false);

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

      bottomNavigationBar: BottomNavigationBar(
          iconSize: 24,

          //backgroundColor: MaterialColor(0xFF2196F3, colorService.colorSwatchShades),
          type: BottomNavigationBarType.fixed, // Prevents background going to white when "shifting" e.g. more than 3 icons

          unselectedItemColor: Colors.grey[500],
          //selectedItemColor: Colors.amberAccent,
          currentIndex: navIndex?? 0,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_outlined),
              label: 'Browse',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_outline),
              label: 'My Sites',
            ),
          ],

          onTap: (index)
          {
              if(index == 0){
                Navigator.pushNamed(context, "/home");
              }else if(index == 1){
                Navigator.pushNamed(context, "/browse");
              }else if(index == 2){
                  Navigator.pushNamed(context, "/search");
              }else if(index == 3){
                  Navigator.pushNamed(context, "/mySites");
              }
          },         //New        
        ),
      body: body
    );
  }
}