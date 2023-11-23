import '../controller/task_allocator_controller.dart';
import '../models/taskallocator_item_model.dart';
import 'package:afriyandi_jp_s_geofence/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskallocatorItemWidget extends StatelessWidget {
  TaskallocatorItemWidget(this.taskallocatorItemModelObj, {this.onTapImgFile});

  TaskallocatorItemModel taskallocatorItemModelObj;

  var controller = Get.find<TaskAllocatorController>();

  VoidCallback? onTapImgFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Container(
        padding: getPadding(
          left: 20,
          top: 15,
          right: 20,
          bottom: 15,
        ),
        decoration: AppDecoration.outlineGray70011.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder6,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: getPadding(
                top: 1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 5,
                    ),
                    child: Obx(
                      () => Text(
                        taskallocatorItemModelObj.typeTxt.value,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtGilroySemiBold18Gray90001,
                      ),
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgEdit,
                    height: getSize(
                      24,
                    ),
                    width: getSize(
                      24,
                    ),
                    margin: getMargin(
                      bottom: 3,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: getHorizontalSize(
                307,
              ),
              margin: getMargin(
                top: 3,
                right: 48,
              ),
              child: Obx(
                () => Text(
                  taskallocatorItemModelObj.languageTxt.value,
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtGilroyMedium12,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 16,
                right: 2,
              ),
              child: Row(
                children: [
                  Container(
                    height: getVerticalSize(
                      24,
                    ),
                    width: getHorizontalSize(
                      63,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse1524x24,
                          height: getSize(
                            24,
                          ),
                          width: getSize(
                            24,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              12,
                            ),
                          ),
                          alignment: Alignment.centerRight,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse1324x251,
                          height: getVerticalSize(
                            24,
                          ),
                          width: getHorizontalSize(
                            25,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              12,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse1224x241,
                          height: getSize(
                            24,
                          ),
                          width: getSize(
                            24,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              12,
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    svgPath: ImageConstant.imgCar,
                    height: getSize(
                      16,
                    ),
                    width: getSize(
                      16,
                    ),
                    margin: getMargin(
                      top: 4,
                      bottom: 4,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 5,
                      top: 3,
                      bottom: 5,
                    ),
                    child: Text(
                      "lbl_12_comments".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtGilroyMedium12,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgFile,
                    height: getSize(
                      16,
                    ),
                    width: getSize(
                      16,
                    ),
                    margin: getMargin(
                      left: 19,
                      top: 4,
                      bottom: 4,
                    ),
                    onTap: () {
                      onTapImgFile?.call();
                    },
                  ),
                  Padding(
                    padding: getPadding(
                      left: 5,
                      top: 4,
                      bottom: 4,
                    ),
                    child: Text(
                      "lbl_0_files".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtGilroyMedium12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
