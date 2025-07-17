import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'screens/cats/cat_details.dart';
import 'style.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CatDetails(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(titleTextStyle: AppBarTextStyle),
        // Text theme section
        textTheme: TextTheme(
          titleLarge: TitleTextStyle,
          bodyLarge: BodyTextStyle,
        ),
      ),
    );
  }
}
