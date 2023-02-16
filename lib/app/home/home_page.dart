import 'package:_app_framework/app/home/my_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return MyScaffold(
      navName: "home",
      body: Column(
        children: [
          Text("Home Page", style: Theme.of(context).textTheme.headlineMedium)
        ],
      )
    );

  }
}

