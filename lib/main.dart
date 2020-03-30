import 'package:flutter/material.dart';
import 'package:three_bee_code_test/pages/honey_points_page.dart';
import 'package:three_bee_code_test/repositories/bee_repository_mock.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3Bee',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 35, 35, 35),
        ),
        textTheme: TextTheme(
          title: TextStyle(color: Colors.white, fontSize: 26),
          subhead: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          subtitle: TextStyle(
            color: Color.fromARGB(255, 246, 197, 119),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          body1: TextStyle(
            color: Color.fromARGB(255, 158, 158, 158),
          ),
        ),
        accentColor: Color.fromARGB(255, 246, 197, 119),
        cardColor: Color.fromARGB(255, 27, 27, 27),
        scaffoldBackgroundColor: Color.fromARGB(255, 35, 35, 35),
      ),
      home: HoneyPointsPage(
        beeRepository: BeeRepositoryMock(),
      ),
    );
  }
}
