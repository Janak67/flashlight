import 'package:flashlight/utils/import.dart';

class ColorController extends GetxController {
  var color = Colors.black.obs;
  RxDouble brightness = 1.0.obs;

  // Color
  void setColor(Color newColor) {
    color.value = newColor;
  }

  Color getTextColor(Color backgroundColor) {
    double brightness = backgroundColor.computeLuminance();
    return brightness > 0.5 ? Colors.black : Colors.white;
  }
}
