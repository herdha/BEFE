import 'package:afriyandi_jp_s_geofence/core/app_export.dart';
import 'package:afriyandi_jp_s_geofence/presentation/geofence_screen/models/geofence_model.dart';

class GeofenceController extends GetxController {
  Rx<GeofenceModel> geofenceModelObj = GeofenceModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
