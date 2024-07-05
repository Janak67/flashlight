import 'package:flashlight/utils/import.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Colors.black,
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: Colors.white, fontSize: 16),
  ),
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.black,
);
ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(color: Colors.black),
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.grey,
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: Colors.black, fontSize: 16),
  ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.grey,
);
