import 'package:flashlight/utils/import.dart';
import 'package:flashlight/widget/pick_color_widget.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  ColorController controller = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                color: controller.color.value,
              ),
              Positioned(
                right: 10,
                child: IconButton(
                  onPressed: () => Get.offAllNamed('home'),
                  icon: Icon(
                    Icons.close,
                    color: controller.getTextColor(controller.color.value),
                  ),
                ),
              ),
              Positioned(
                right: 55,
                child: IconButton(
                  onPressed: () => pickColor(context),
                  icon: Icon(
                    Icons.color_lens_outlined,
                    size: 27,
                    color: controller.getTextColor(controller.color.value),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
