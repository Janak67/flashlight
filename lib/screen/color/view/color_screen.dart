import 'package:flashlight/utils/import.dart';

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
        body: InkWell(
          onTap: () => controller.toggleButtonVisibility(),
          child: Obx(
            () => Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: controller.color.value,
              child: controller.isButtonVisible.value
                  ? Container(
                      height: 40,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: controller
                                .getTextColor(controller.color.value)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: InkWell(
                        onTap: () => pickColor(context),
                        child: Text(
                          'Change Color',
                          style: TextStyle(
                              color: controller
                                  .getTextColor(controller.color.value)),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}
