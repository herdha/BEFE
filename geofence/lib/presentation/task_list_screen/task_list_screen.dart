import 'controller/task_list_controller.dart';
import 'package:afriyandi_jp_s_geofence/core/app_export.dart';
import 'package:afriyandi_jp_s_geofence/widgets/app_bar/appbar_image.dart';
import 'package:afriyandi_jp_s_geofence/widgets/app_bar/appbar_title.dart';
import 'package:afriyandi_jp_s_geofence/widgets/app_bar/custom_app_bar.dart';
import 'package:afriyandi_jp_s_geofence/widgets/custom_button.dart';
import 'package:afriyandi_jp_s_geofence/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';

class TaskListScreen extends GetWidget<TaskListController> {
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
                      onTapArrowleft();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_my_tasks".tr),
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
                              padding: getPadding(left: 16, top: 24),
                              child: Text("lbl_this_week".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroySemiBold20))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 31),
                              child: Text("msg_monday_12th_may".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroySemiBold16))),
                      Container(
                          margin: getMargin(left: 16, top: 18, right: 16),
                          padding: getPadding(
                              left: 16, top: 17, right: 16, bottom: 17),
                          decoration: AppDecoration.outlineGray70011.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder6),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: getPadding(top: 3, bottom: 1),
                                    child: Text("lbl_buy_groceries".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtGilroySemiBold16Gray900)),
                                CustomButton(
                                    height: getVerticalSize(23),
                                    width: getHorizontalSize(85),
                                    text: "lbl_high_priority".tr,
                                    margin: getMargin(bottom: 1),
                                    variant: ButtonVariant.FillGray100,
                                    padding: ButtonPadding.PaddingAll3,
                                    fontStyle: ButtonFontStyle.GilroyMedium12)
                              ])),
                      Container(
                          margin: getMargin(left: 16, top: 16, right: 16),
                          padding: getPadding(
                              left: 16, top: 17, right: 16, bottom: 17),
                          decoration: AppDecoration.outlineGray70011.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder6),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: getPadding(top: 2, bottom: 1),
                                    child: Text("lbl_cardio_at_6_pm".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtGilroySemiBold16Gray900)),
                                CustomButton(
                                    height: getVerticalSize(23),
                                    width: getHorizontalSize(81),
                                    text: "lbl_low_priority".tr,
                                    margin: getMargin(bottom: 1),
                                    variant: ButtonVariant.FillDeeporangeA10033,
                                    padding: ButtonPadding.PaddingAll3,
                                    fontStyle: ButtonFontStyle
                                        .GilroyMedium12Deeporange400)
                              ])),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 28),
                              child: Text("msg_wednesday_14th".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroySemiBold16))),
                      Container(
                          margin: getMargin(left: 16, top: 17, right: 16),
                          padding: getPadding(
                              left: 16, top: 17, right: 16, bottom: 17),
                          decoration: AppDecoration.outlineGray70011.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder6),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: getPadding(top: 1, bottom: 2),
                                    child: Text("lbl_dinner_with_bae".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtGilroySemiBold16Gray900)),
                                CustomButton(
                                    height: getVerticalSize(23),
                                    width: getHorizontalSize(85),
                                    text: "lbl_high_priority".tr,
                                    margin: getMargin(bottom: 1),
                                    variant: ButtonVariant.FillGray100,
                                    padding: ButtonPadding.PaddingAll3,
                                    fontStyle: ButtonFontStyle.GilroyMedium12)
                              ])),
                      Container(
                          margin: getMargin(
                              left: 16, top: 16, right: 16, bottom: 377),
                          padding: getPadding(
                              left: 16, top: 17, right: 16, bottom: 17),
                          decoration: AppDecoration.outlineGray70011.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder6),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: getPadding(top: 2, bottom: 1),
                                    child: Text("msg_pay_college_fees".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtGilroySemiBold16Gray900)),
                                CustomButton(
                                    height: getVerticalSize(23),
                                    width: getHorizontalSize(81),
                                    text: "lbl_low_priority".tr,
                                    margin: getMargin(bottom: 1),
                                    variant: ButtonVariant.FillDeeporangeA10033,
                                    padding: ButtonPadding.PaddingAll3,
                                    fontStyle: ButtonFontStyle
                                        .GilroyMedium12Deeporange400)
                              ]))
                    ])),
            floatingActionButton: CustomFloatingButton(
                height: 60,
                width: 60,
                child: CustomImageView(
                    svgPath: ImageConstant.imgPlus,
                    height: getVerticalSize(30.0),
                    width: getHorizontalSize(30.0)))));
  }

  onTapArrowleft() {
    Get.back();
  }
}
