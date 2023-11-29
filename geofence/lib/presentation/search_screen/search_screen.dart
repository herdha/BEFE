import '../search_screen/widgets/search_item_widget.dart';
import 'controller/search_controller.dart';
import 'models/search_item_model.dart';
import 'package:afriyandi_jp_s_geofence/core/app_export.dart';
import 'package:afriyandi_jp_s_geofence/widgets/app_bar/appbar_image.dart';
import 'package:afriyandi_jp_s_geofence/widgets/app_bar/custom_app_bar.dart';
import 'package:afriyandi_jp_s_geofence/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class SearchScreen extends GetWidget<SearchControllers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(74),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 16, bottom: 16),
                    onTap: () {
                      onTapArrowleft6();
                    }),
                centerTitle: true,
                title: CustomSearchView(
                    width: getHorizontalSize(320),
                    focusNode: FocusNode(),
                    controller: controller.inputFieldController,
                    hintText: "lbl_search_anything".tr,
                    variant: SearchViewVariant.OutlineBluegray100_1,
                    padding: SearchViewPadding.PaddingT11,
                    fontStyle: SearchViewFontStyle.GilroyMedium16Bluegray200,
                    prefix: Container(
                        margin:
                            getMargin(left: 12, top: 12, right: 8, bottom: 12),
                        child:
                            CustomImageView(svgPath: ImageConstant.imgSearch)),
                    prefixConstraints:
                        BoxConstraints(maxHeight: getVerticalSize(44)),
                    suffix: Padding(
                        padding: EdgeInsets.only(right: getHorizontalSize(15)),
                        child: IconButton(
                            onPressed: () {
                              controller.inputFieldController.clear();
                            },
                            icon: Icon(Icons.clear,
                                color: Colors.grey.shade600)))),
                actions: [
                  AppbarImage(
                      height: getSize(20),
                      width: getSize(20),
                      svgPath: ImageConstant.imgMicrophone,
                      margin:
                          getMargin(left: 16, top: 18, right: 16, bottom: 18))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 10, right: 16, bottom: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Divider(
                          height: getVerticalSize(1),
                          thickness: getVerticalSize(1),
                          color: ColorConstant.blueGray100),
                      Padding(
                          padding: getPadding(top: 8),
                          child: Obx(() => ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return Padding(
                                    padding: getPadding(top: 9.0, bottom: 9.0),
                                    child: SizedBox(
                                        width: getHorizontalSize(396),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.blueGray100)));
                              },
                              itemCount: controller.searchModelObj.value
                                  .searchItemList.value.length,
                              itemBuilder: (context, index) {
                                SearchItemModel model = controller
                                    .searchModelObj
                                    .value
                                    .searchItemList
                                    .value[index];
                                return SearchItemWidget(model);
                              }))),
                      Padding(
                          padding: getPadding(top: 9, bottom: 5),
                          child: Divider(
                              height: getVerticalSize(1),
                              thickness: getVerticalSize(1),
                              color: ColorConstant.blueGray100))
                    ]))));
  }

  onTapArrowleft6() {
    Get.back();
  }
}
