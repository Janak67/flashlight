import 'package:flashlight/utils/import.dart';

class SettingController extends GetxController {
  RxBool isLight = true.obs;

  // Theme
  void changeTheme() async {
    bool? isTheme = await ShareHelper.shareHelper.getTheme();
    isLight.value = isTheme ?? false;
  }

  void toggleTheme() async {
    isLight.value = !isLight.value;
    await ShareHelper.shareHelper.setTheme(isLight.value);
  }
}
