import '../task_allocator_screen/widgets/taskallocator_item_widget.dart';
import 'controller/task_allocator_controller.dart';
import 'models/taskallocator_item_model.dart';
import 'package:afriyandi_jp_s_geofence/core/app_export.dart';
import 'package:afriyandi_jp_s_geofence/widgets/app_bar/appbar_image.dart';
import 'package:afriyandi_jp_s_geofence/widgets/app_bar/appbar_title.dart';
import 'package:afriyandi_jp_s_geofence/widgets/app_bar/custom_app_bar.dart';
import 'package:afriyandi_jp_s_geofence/widgets/custom_drop_down.dart';
import 'package:afriyandi_jp_s_geofence/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';

class TaskAllocatorScreen extends GetWidget<TaskAllocatorController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(53),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 12, bottom: 17),
                    onTap: () {
                      onTapArrowleft3();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_task_management".tr),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgOverflowmenu1,
                      margin:
                          getMargin(left: 16, top: 12, right: 16, bottom: 17))
                ]),
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 25),
                              child: Text("msg_select_department".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroySemiBold18))),
                      CustomDropDown(
                          focusNode: FocusNode(),
                          icon: Container(
                              margin: getMargin(left: 30, right: 16),
                              child: CustomImageView(
                                  svgPath:
                                      ImageConstant.imgArrowdownBlueGray200)),
                          hintText: "lbl_design".tr,
                          margin: getMargin(left: 16, top: 17, right: 16),
                          items: controller.taskAllocatorModelObj.value
                              .dropdownItemList.value,
                          onChanged: (value) {
                            controller.onSelected(value);
                          }),
                      Padding(
                          padding: getPadding(
                              left: 16, top: 16, right: 16, bottom: 256),
                          child: Obx(() => ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(16));
                              },
                              itemCount: controller.taskAllocatorModelObj.value
                                  .taskallocatorItemList.value.length,
                              itemBuilder: (context, index) {
                                TaskallocatorItemModel model = controller
                                    .taskAllocatorModelObj
                                    .value
                                    .taskallocatorItemList
                                    .value[index];
                                return TaskallocatorItemWidget(model,
                                    onTapImgFile: () {
                                  onTapImgFile();
                                });
                              })))
                    ])),
            floatingActionButton: CustomFloatingButton(
                height: 60,
                width: 60,
                child: CustomImageView(
                    svgPath: ImageConstant.imgPlus,
                    height: getVerticalSize(30.0),
                    width: getHorizontalSize(30.0)))));
  }

  onTapImgFile() async {
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? fileList = [];
    FileManager().filePickerMethod(1000 * 1000, ['pdf', 'doc'],
        getFiles: (value) {
      fileList = value;
    });
  }

  onTapArrowleft3() {
    Get.back();
  }
}
