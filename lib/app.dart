import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home/home.dart';
import 'screens/cats/cat_details.dart';
import 'style.dart';
import 'screens/home/providers/cat_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CatProvider())],
      child: MaterialApp(
        home: HomeScreen(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(titleTextStyle: AppBarTextStyle),
          // Text theme section
          textTheme: TextTheme(
            titleLarge: TitleTextStyle,
            bodyLarge: BodyTextStyle,
          ),
        ),
      ),
    );
  }
}
