import 'package:flashlight/utils/import.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());
  SettingController setController = Get.put(SettingController());

  @override
  void initState() {
    super.initState();
    AdsHelper.adsHelper.initBanner();
    AdsHelper.adsHelper.interstitialAds();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => Get.to(() => const SettingsScreen(),
                  transition: Transition.rightToLeftWithFade),
              icon: const Icon(Icons.settings_outlined),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              Obx(
                () => IconButton(
                  onPressed: () {
                    controller.toggleFlashlight();
                    controller.strobeOn.value = false;
                    controller.showSlider.value = false;
                    controller.strobeTimer!.cancel();
                  },
                  icon: Icon(
                      controller.isFlashlight.value
                          ? Icons.flashlight_off_outlined
                          : Icons.flashlight_on_outlined,
                      color: controller.isFlashlight.value
                          ? setController.isLight.value
                              ? Colors.white
                              : Colors.black
                          : Colors.blueAccent,
                      size: 70),
                ),
              ),
              const SizedBox(height: 40),
              IconButton(
                onPressed: () {
                  if (AdsHelper.adsHelper.interstitialAd != null) {
                    AdsHelper.adsHelper.interstitialAd!.show();
                    AdsHelper.adsHelper.interstitialAd!
                        .fullScreenContentCallback = FullScreenContentCallback(
                      onAdDismissedFullScreenContent: (ad) {
                        Get.snackbar(
                            "Advertisement", "Interstitial Ad dismissed");
                      },
                    );
                    AdsHelper.adsHelper.interstitialAds();
                  } else {
                    AdsHelper.adsHelper.interstitialAds();
                  }
                  Get.to(() => const ColorScreen(),
                      transition: Transition.zoom);
                },
                icon: Obx(
                  () => Icon(Icons.color_lens_outlined,
                      size: 45,
                      color: setController.isLight.value
                          ? Colors.white
                          : Colors.black),
                ),
              ),
              const SizedBox(height: 40),
              Obx(
                () => IconButton(
                  onPressed: () {
                    controller.toggleFlashlight();
                    controller.initializeFlashlight();
                    controller.strobeEffect();
                  },
                  icon: Icon(Icons.sos_outlined,
                      color: controller.strobeOn.value
                          ? Colors.blue
                          : setController.isLight.value
                              ? Colors.white
                              : Colors.black,
                      size: 45),
                ),
              ),
              const SizedBox(height: 40),
              Obx(
                () => controller.showSlider.value
                    ? SizedBox(
                        width: 350,
                        child: Slider(
                          activeColor: Colors.blue,
                          value: controller.strobeInterval.value.toDouble(),
                          min: 100,
                          max: 1000,
                          divisions: 10,
                          onChanged: (value) => controller.updateStrobo(value),
                          label: controller.strobeInterval.value.toString(),
                        ),
                      )
                    : const SizedBox(),
              ),
              AdsHelper.adsHelper.bannerAd == null
                  ? Container()
                  : SizedBox(
                      height: 100,
                      child: AdWidget(ad: AdsHelper.adsHelper.bannerAd!),
                    ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
