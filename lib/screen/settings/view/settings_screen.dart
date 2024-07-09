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
            ListTile(
              onTap: () async {
                Uri url = Uri.parse(
                    'https://brightlightapps.blogspot.com/2024/07/privacy-policy.html');
                if (!await launchUrl(url,
                    mode: LaunchMode.externalApplication)) {
                  throw 'Could not launch $url';
                }
              },
              title: Text(
                'Privacy Policy',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ListTile(
              onTap: () async {
                Uri url = Uri.parse(
                    'https://brightlightapps.blogspot.com/2024/07/terms-conditions.html');
                if (!await launchUrl(url,
                    mode: LaunchMode.externalApplication)) {
                  throw 'Could not launch $url';
                }
              },
              title: Text('Terms And Conditions',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          ],
        ),
      ),
    );
  }
}
