import 'package:flutter/material.dart';
import 'package:flutterapp/provider/my_data_provider.dart';
import 'package:flutterapp/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'model/district.dart';
import 'model/statewise.dart';
import 'model/world.dart';
import 'model/world.dart';
import 'model/worldnews.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyData myData = MyData();
    return MultiProvider(
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Baloon',
        ),
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
      ),
      providers: [
        FutureProvider<List<StateObject>>(initialData: [],
          create: (BuildContext context) => myData.getStateResults(),
        ),
        FutureProvider<List<DistrictObject>>(initialData: [],
          create: (BuildContext context) => myData.getDistrictsList(),
        ),
        FutureProvider<WorldWide?>(initialData: WorldWide(),
          create: (BuildContext context) => myData.getWorldWideData(),
        ),
        FutureProvider(initialData: [],
          create: (BuildContext context) => myData.getWorldNews(),
        )
      ],
    );
  }
}
