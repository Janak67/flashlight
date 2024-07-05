import 'package:flashlight/utils/import.dart';

class ShareHelper {
  static ShareHelper shareHelper = ShareHelper._();

  ShareHelper._();

  Future<void> setTheme(bool isTheme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool('theme', isTheme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? isTheme = shr.getBool('theme');
    return isTheme;
  }
}
