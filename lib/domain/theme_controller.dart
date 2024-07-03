import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

GetStorage box = GetStorage();

class ThemeController extends GetxController {
  bool isLight = box.read('theme') ?? true;
  void switchTheme() {
    isLight = !isLight;
    box.write('theme', isLight);
    update();
  }
}
