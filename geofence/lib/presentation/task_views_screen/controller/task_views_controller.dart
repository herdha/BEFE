import 'package:afriyandi_jp_s_geofence/core/app_export.dart';
import 'package:afriyandi_jp_s_geofence/presentation/task_views_screen/models/task_views_model.dart';

class TaskViewsController extends GetxController {
  Rx<TaskViewsModel> taskViewsModelObj = TaskViewsModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
