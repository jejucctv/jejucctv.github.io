import 'package:flutter/material.dart';
import 'package:jejucctv/screens/dashboard/dashboard.dart';
// import 'package:jejucctv/screens/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Map<String, WidgetBuilder> routes = {
      // '/': (BuildContext context) => Login(),
      // '/': (BuildContext context) => HomeScreen(),
    // };
    return MaterialApp(
      // initialRoute: '/',
      // routes: routes,
      theme: ThemeData(),
      debugShowCheckedModeBanner: true,
      title: '제주도 CCTV',
      home: Dashboard(),
    );
  }
}
