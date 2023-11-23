import 'controller/map_settings_controller.dart';
import 'package:afriyandi_jp_s_geofence/core/app_export.dart';
import 'package:afriyandi_jp_s_geofence/widgets/custom_icon_button.dart';
import 'package:afriyandi_jp_s_geofence/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class MapSettingsScreen extends GetWidget<MapSettingsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.black90011,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: ColorConstant.black90011,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgMapsettings,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 16,
              top: 24,
              right: 16,
              bottom: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomSearchView(
                  focusNode: FocusNode(),
                  controller: controller.inputFieldController,
                  hintText: "lbl_search_location".tr,
                  prefix: Container(
                    margin: getMargin(
                      left: 12,
                      top: 12,
                      right: 8,
                      bottom: 12,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgSearch,
                    ),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      44,
                    ),
                  ),
                  suffix: Container(
                    margin: getMargin(
                      left: 30,
                      top: 12,
                      right: 12,
                      bottom: 12,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgMicrophone,
                    ),
                  ),
                  suffixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      44,
                    ),
                  ),
                ),
                CustomIconButton(
                  height: 40,
                  width: 40,
                  margin: getMargin(
                    top: 8,
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgPlus40x40,
                  ),
                ),
                CustomIconButton(
                  height: 40,
                  width: 40,
                  margin: getMargin(
                    top: 8,
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgMinussolid,
                  ),
                ),
                CustomIconButton(
                  height: 40,
                  width: 40,
                  margin: getMargin(
                    top: 8,
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgSettings,
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    margin: getMargin(
                      bottom: 34,
                    ),
                    color: ColorConstant.whiteA700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.circleBorder25,
                    ),
                    child: Container(
                      height: getSize(
                        50,
                      ),
                      width: getSize(
                        50,
                      ),
                      decoration: AppDecoration.fillWhiteA700.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder25,
                      ),
                      child: Stack(
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgDashboard,
                            height: getSize(
                              50,
                            ),
                            width: getSize(
                              50,
                            ),
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
