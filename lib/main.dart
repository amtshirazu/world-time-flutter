import 'package:flutter/material.dart';
import 'package:world_time/pages/home_page.dart';
import 'package:world_time/pages/loading_page.dart';
import 'package:world_time/pages/location_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(),
        '/home': (context) => HomePage(),
        '/location': (context) => LocationPage(),
      },
    ),
  );
}
