import 'package:flashlight/utils/import.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingController controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('COLOR CUSTOMIZATION',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            ListTile(
              title:
                  Text('Theme', style: Theme.of(context).textTheme.titleMedium),
              trailing: Obx(
                () => IconButton(
                  onPressed: () => controller.toggleTheme(),
                  icon: Icon(
                      controller.isLight.value
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      color: controller.isLight.value
                          ? Colors.white
                          : Colors.black),
                ),
              ),
            ),
            ListTile(
              title:
                  Text('ABOUT', style: Theme.of(context).textTheme.titleLarge),
            ),
            customListTile('Customer Support'),
            customListTile('Rate Us'),
            customListTile('Privacy Policy'),
            customListTile('Terms And Conditions'),
          ],
        ),
      ),
    );
  }

  ListTile customListTile(String text) {
    return ListTile(
      title: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
