import 'package:flashlight/utils/import.dart';

class HomeController extends GetxController {
  RxBool isFlashlight = false.obs;
  RxBool isSOS = false.obs;
  RxBool strobeOn = false.obs;
  RxInt strobeInterval = 500.obs;
  Timer? strobeTimer;
  var showSlider = false.obs;
  var isListening = false.obs;
  FlutterSoundRecorder? recorder;
  StreamSubscription? recorderSubscription;

  @override
  void onInit() {
    super.onInit();
    recorder = FlutterSoundRecorder();
    requestPermissions();
  }

  @override
  void onClose() {
    recorder?.closeRecorder();
    recorderSubscription?.cancel();
    super.onClose();
  }

  Future<void> requestPermissions() async {
    await [
      Permission.microphone,
      Permission.camera,
      Permission.sensors,
    ].request();
  }

  void startListening() {
    var micStream = MicStream.microphone(
      audioSource: AudioSource.MIC,
      sampleRate: 44100,
    );

    recorderSubscription = micStream.listen((samples) {
      double amplitude = getAmplitude(samples);
      if (detectBeat(amplitude)) {
        toggleFlashlight();
      }
    });

    isListening.value = true;
  }

  void stopListening() async {
    recorderSubscription?.cancel();
    isListening.value = false;
  }

  double getAmplitude(List<int> samples) {
    int sum = samples.fold(0, (sum, sample) => sum + sample.abs());
    return sum / samples.length;
  }

  bool detectBeat(double amplitude) {
    if (amplitude > 50) {
      return true;
    }
    return false;
  }

  // FlashLight
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
