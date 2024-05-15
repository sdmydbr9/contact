import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends CupertinoApp {
  MyApp({super.key})
      : super(
          theme: const CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
              navLargeTitleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Eyesome',
                fontStyle: FontStyle.italic,
                color: CupertinoColors.activeGreen,
              ),
            ),
          ),
          home: const MyHomePage(),
        );
}
