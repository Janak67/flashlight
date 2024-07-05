import 'package:flashlight/utils/import.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SettingController controller = Get.put(SettingController());

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offAllNamed('home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0D1015),
        body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/img/logo.png', height: 80),
          ),
        ),
      ),
    );
  }
}
