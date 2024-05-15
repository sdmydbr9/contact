import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: CupertinoColors
            .systemGrey, // Set the background color of the app to system grey
        brightness: Brightness.light, // Ensure the brightness is set to light
        primaryColor: CupertinoDynamicColor.withBrightness(
          color: Colors.white,
          darkColor: CupertinoColors.black,
        ),
        textTheme: CupertinoTextThemeData(
          navLargeTitleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Eyesome',
            fontStyle: FontStyle.italic,
            color: Colors.white, // Set the text color of large titles to white
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
