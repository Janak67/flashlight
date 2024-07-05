import 'package:flashlight/utils/import.dart';

void main() {
  SettingController controller = Get.put(SettingController());
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(
    Obx(
      () {
        controller.changeTheme();
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          routes: screen_routes,
          theme: controller.isLight.value ? lightTheme : darkTheme,
        );
      },
    ),
  );
}
