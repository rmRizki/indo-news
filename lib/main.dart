import 'package:flutter/material.dart';
import 'screens/detail_page.dart';
import 'screens/info_page.dart';
import 'screens/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Indo News',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/detail': (context) => DetailPage(),
        '/info': (context) => InfoPage(),
      },
    );
  }
}
