import 'controller/geofence_controller.dart';
import 'package:afriyandi_jp_s_geofence/core/app_export.dart';
import 'package:afriyandi_jp_s_geofence/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class GeofenceScreen extends GetWidget<GeofenceController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        body: Container(
          height: size.height,
          width: double.maxFinite,
          padding: getPadding(
            left: 16,
            top: 24,
            right: 16,
            bottom: 24,
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: getPadding(
                    left: 54,
                    top: 217,
                    right: 39,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: getMargin(
                          left: 90,
                        ),
                        padding: getPadding(
                          all: 4,
                        ),
                        decoration: AppDecoration.outlineBlack90019.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder9,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: getSize(
                                9,
                              ),
                              width: getSize(
                                9,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.blue200,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    4,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 45,
                          right: 57,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: getMargin(
                                top: 18,
                              ),
                              padding: getPadding(
                                all: 4,
                              ),
                              decoration:
                                  AppDecoration.outlineBlack90019.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder9,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: getSize(
                                      9,
                                    ),
                                    width: getSize(
                                      9,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.blue200,
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          4,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: getMargin(
                                bottom: 18,
                              ),
                              padding: getPadding(
                                all: 4,
                              ),
                              decoration:
                                  AppDecoration.outlineBlack90019.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder9,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: getSize(
                                      9,
                                    ),
                                    width: getSize(
                                      9,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.blue200,
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          4,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgSearchBlueA700,
                        height: getSize(
                          18,
                        ),
                        width: getSize(
                          18,
                        ),
                        alignment: Alignment.centerRight,
                        margin: getMargin(
                          top: 109,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: getPadding(
                            left: 52,
                            top: 51,
                            right: 18,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgSearchBlueA700,
                                height: getSize(
                                  18,
                                ),
                                width: getSize(
                                  18,
                                ),
                                margin: getMargin(
                                  top: 13,
                                ),
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgSearchBlueA700,
                                height: getSize(
                                  18,
                                ),
                                width: getSize(
                                  18,
                                ),
                                margin: getMargin(
                                  bottom: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: getVerticalSize(
                        706,
                      ),
                      width: getHorizontalSize(
                        396,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgRectangle458706x396,
                            height: getVerticalSize(
                              706,
                            ),
                            width: getHorizontalSize(
                              396,
                            ),
                            radius: BorderRadius.circular(
                              getHorizontalSize(
                                10,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          CustomImageView(
                            svgPath: ImageConstant.imgVector3Gray90001,
                            height: getVerticalSize(
                              339,
                            ),
                            width: getHorizontalSize(
                              298,
                            ),
                            alignment: Alignment.bottomCenter,
                            margin: getMargin(
                              bottom: 145,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      height: getVerticalSize(
                        50,
                      ),
                      text: "lbl_set_geofence".tr,
                      margin: getMargin(
                        top: 40,
                      ),
                      padding: ButtonPadding.PaddingAll15,
                      fontStyle: ButtonFontStyle.GilroyMedium16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
