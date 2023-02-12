import 'dart:async';


import 'package:_app_framework/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/us_data.dart';
import '../../services/logging_service.dart';


class RestApi extends StatefulWidget {
  const RestApi({super.key});

  @override
  RestApiState createState() => RestApiState();
}

class RestApiState extends State<RestApi> {
  late Future<USData> futureUSData;

  @override
  void initState() {
    super.initState();

    final loggingService = Provider.of<LoggingService>(context, listen: false);
    final logger = loggingService.getLogger(this);

    final apiService = ApiService();

    try {
      futureUSData = apiService.fetchData<USData>('https://datausa.io/api/data?drilldowns=Nation&measures=Population', USData.parseJson);  
    } catch (ex, st) 
    {
      logger.e("HTTP Error", ex, st);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Test'),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back), 
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          FutureBuilder<USData>(
            future: futureUSData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.data[3].toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
          ],
        ),
      ),
    );
  }
}
