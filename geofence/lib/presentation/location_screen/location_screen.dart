import 'controller/location_controller.dart';
import 'package:afriyandi_jp_s_geofence/core/app_export.dart';
import 'package:afriyandi_jp_s_geofence/widgets/app_bar/appbar_image.dart';
import 'package:afriyandi_jp_s_geofence/widgets/app_bar/appbar_title.dart';
import 'package:afriyandi_jp_s_geofence/widgets/app_bar/custom_app_bar.dart';
import 'package:afriyandi_jp_s_geofence/widgets/custom_button.dart';
import 'package:afriyandi_jp_s_geofence/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LocationScreen extends GetWidget<LocationController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(49),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 12, bottom: 13),
                    onTap: () {
                      onTapArrowleft5();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_location".tr)),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 24, right: 16, bottom: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(643),
                          width: getHorizontalSize(396),
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgRectangle458706x396,
                                height: getVerticalSize(643),
                                width: getHorizontalSize(396),
                                radius: BorderRadius.circular(
                                    getHorizontalSize(10)),
                                alignment: Alignment.center),
                            CustomTextFormField(
                                width: getHorizontalSize(364),
                                focusNode: FocusNode(),
                                controller: controller.inputFieldController,
                                hintText: "msg_2992_terry_lane".tr,
                                margin: getMargin(top: 25),
                                textInputAction: TextInputAction.done,
                                alignment: Alignment.topCenter)
                          ])),
                      CustomButton(
                          height: getVerticalSize(50),
                          text: "lbl_reset_map".tr,
                          margin: getMargin(top: 35, bottom: 5),
                          padding: ButtonPadding.PaddingAll15,
                          fontStyle: ButtonFontStyle.GilroyMedium16)
                    ]))));
  }

  onTapArrowleft5() {
    Get.back();
  }
}
