import 'package:flashlight/utils/import.dart';

class HomeController extends GetxController {
  RxBool isFlashlight = false.obs;
  RxBool isSOS = false.obs;
  RxBool strobeOn = false.obs;
  RxInt strobeInterval = 500.obs;
  Timer? strobeTimer;
  var showSlider = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeFlashlightState();
  }

  // FlashLight
  void initializeFlashlightState() async {
    try {
      bool isOn = await TorchLight.isTorchAvailable();
      isFlashlight.value = isOn;
    } catch (e) {
      print("Error initializing flashlight state: $e");
    }
  }

  void toggleFlashlight() async {
    isFlashlight.value = !isFlashlight.value;
    if (isFlashlight.value) {
      await TorchLight.disableTorch();
    } else {
      await TorchLight.enableTorch();
    }
  }

  // Strobe
  void strobeEffect() async {
    if (strobeOn.value) {
      strobeTimer?.cancel();
      strobeTimer = null;
      TorchLight.disableTorch();
      isSOS.value = false;
    } else {
      startStrobo();
    }
    strobeOn.value = !strobeOn.value;
    showSlider.value = strobeOn.value;
  }

  void startStrobo() {
    strobeTimer = Timer.periodic(
      Duration(milliseconds: strobeInterval.value),
      (timer) async {
        if (isSOS.value) {
          await TorchLight.disableTorch();
        } else {
          await TorchLight.enableTorch();
        }
        isSOS.value = !isSOS.value;
      },
    );
  }

  void updateStrobo(double value) {
    strobeInterval.value = value.toInt();
    if (strobeOn.value) {
      strobeTimer?.cancel();
      startStrobo();
    }
  }
}
