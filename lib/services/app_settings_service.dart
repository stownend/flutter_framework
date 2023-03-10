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

  var navigationPages = [
    NavigationRoute("Home", "/home", const Icon(Icons.home_outlined)),
    NavigationRoute("Browse", "/browse", const Icon(Icons.account_tree_outlined)),
    NavigationRoute("Search", "/search", const Icon(Icons.search_outlined)),
    NavigationRoute("My Sites", "/mySites", const Icon(Icons.star_outline)),
  ];

  int getRouteIndexByUiName(String nameToFind) {

    int routeIndex = 0;
    
    for (var index = 0; index < navigationPages.length; index++) {
      if (navigationPages[index].uiName.toLowerCase() == nameToFind.toLowerCase()) {
        routeIndex = index;
      }
    }

    return routeIndex;
  }

  NavigationRoute getRouteByIndex(int index) {

    return navigationPages[index];
  }

}

class NavigationRoute {
  String uiName;
  String routeName;
  Icon icon;

  NavigationRoute(this.uiName, this.routeName, this.icon);
}