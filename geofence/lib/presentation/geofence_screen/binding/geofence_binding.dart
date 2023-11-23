import '../controller/geofence_controller.dart';
import 'package:get/get.dart';

class GeofenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GeofenceController());
  }
}
