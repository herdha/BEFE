import 'package:get/get.dart';
import 'package:afriyandi_jp_s_geofence/data/models/selectionPopupModel/selection_popup_model.dart';
import 'taskallocator_item_model.dart';

class TaskAllocatorModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);

  Rx<List<TaskallocatorItemModel>> taskallocatorItemList =
      Rx(List.generate(3, (index) => TaskallocatorItemModel()));
}
