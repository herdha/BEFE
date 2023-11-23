import 'package:afriyandi_jp_s_geofence/core/app_export.dart';
import 'package:afriyandi_jp_s_geofence/presentation/task_allocator_screen/models/task_allocator_model.dart';

class TaskAllocatorController extends GetxController {
  Rx<TaskAllocatorModel> taskAllocatorModelObj = TaskAllocatorModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    taskAllocatorModelObj.value.dropdownItemList.value.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    taskAllocatorModelObj.value.dropdownItemList.refresh();
  }
}
