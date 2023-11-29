import 'package:afriyandi_jp_s_geofence/core/app_export.dart';
import 'package:afriyandi_jp_s_geofence/presentation/search_screen/models/search_model.dart';
import 'package:flutter/material.dart';

class SearchControllers extends GetxController {
  TextEditingController inputFieldController = TextEditingController();

  Rx<SearchModel> searchModelObj = SearchModel().obs;

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
