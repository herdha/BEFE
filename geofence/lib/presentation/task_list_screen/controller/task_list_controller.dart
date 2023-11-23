import 'package:afriyandi_jp_s_geofence/core/app_export.dart';
import 'package:afriyandi_jp_s_geofence/presentation/task_list_screen/models/task_list_model.dart';

class TaskListController extends GetxController {
  Rx<TaskListModel> taskListModelObj = TaskListModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
