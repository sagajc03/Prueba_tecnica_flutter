import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/cats/cats.dart';
import 'screens/cat/cat_details.dart';
import 'style.dart';
import 'screens/cats/providers/cat_provider.dart';

const catListRoute = '/';
const catDetailsRoute = '/catDetails';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CatProvider())],
      child: MaterialApp(
        home: HomeScreen(),
        onGenerateRoute: _routes(),
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

  RouteFactory _routes() {
    return (settings) {
      final arguments = settings.arguments as Map<String, String>?;
      Widget screen;
      switch (settings.name) {
        case catListRoute:
          screen = HomeScreen();
          break;
        case catDetailsRoute:
          if (arguments != null && arguments.containsKey('catId')) {
            screen = CatDetails(catId: arguments['catId']!);
          } else {
            screen = HomeScreen(); // Fallback to home if no valid argument
          }
          break;
        default:
          screen = HomeScreen(); // Fallback to home for unknown routes
      }
      return MaterialPageRoute(
        builder: (BuildContext context) => screen,
        settings: settings,
      );
    };
  }
}
