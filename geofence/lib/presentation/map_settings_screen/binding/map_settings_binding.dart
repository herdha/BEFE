import '../controller/map_settings_controller.dart';
import 'package:get/get.dart';

class MapSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapSettingsController());
  }
}
