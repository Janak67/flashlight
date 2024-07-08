import 'package:flashlight/utils/import.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void pickColor(BuildContext context) {
  ColorController controller = Get.put(ColorController());
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Pick a color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: controller.color.value,
            onColorChanged: (color) => controller.setColor(color),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Get.back(),
            child: const Text('Select'),
          ),
        ],
      );
    },
  );
}
