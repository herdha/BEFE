import 'package:afriyandi_jp_s_geofence/core/app_export.dart';
import 'package:afriyandi_jp_s_geofence/presentation/splash_screen/models/splash_model.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.emailLoginScreen,
      );
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
