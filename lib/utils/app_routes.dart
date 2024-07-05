import 'package:flashlight/utils/import.dart';

Map<String, WidgetBuilder> screen_routes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
  'color': (context) => const ColorScreen(),
  'setting': (context) => const SettingsScreen(),
};
