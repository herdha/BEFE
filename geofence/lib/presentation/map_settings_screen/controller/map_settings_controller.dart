import 'package:afriyandi_jp_s_geofence/core/app_export.dart';
import 'package:afriyandi_jp_s_geofence/presentation/map_settings_screen/models/map_settings_model.dart';
import 'package:flutter/material.dart';

class MapSettingsController extends GetxController {
  TextEditingController inputFieldController = TextEditingController();

  Rx<MapSettingsModel> mapSettingsModelObj = MapSettingsModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    inputFieldController.dispose();
  }
}
