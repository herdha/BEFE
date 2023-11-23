import 'package:afriyandi_jp_s_geofence/presentation/task_list_screen/task_list_screen.dart';
import 'package:afriyandi_jp_s_geofence/presentation/task_list_screen/binding/task_list_binding.dart';
import 'package:afriyandi_jp_s_geofence/presentation/email_login_screen/email_login_screen.dart';
import 'package:afriyandi_jp_s_geofence/presentation/email_login_screen/binding/email_login_binding.dart';
import 'package:afriyandi_jp_s_geofence/presentation/map_settings_screen/map_settings_screen.dart';
import 'package:afriyandi_jp_s_geofence/presentation/map_settings_screen/binding/map_settings_binding.dart';
import 'package:afriyandi_jp_s_geofence/presentation/map_screen/map_screen.dart';
import 'package:afriyandi_jp_s_geofence/presentation/map_screen/binding/map_binding.dart';
import 'package:afriyandi_jp_s_geofence/presentation/task_allocator_screen/task_allocator_screen.dart';
import 'package:afriyandi_jp_s_geofence/presentation/task_allocator_screen/binding/task_allocator_binding.dart';
import 'package:afriyandi_jp_s_geofence/presentation/task_views_screen/task_views_screen.dart';
import 'package:afriyandi_jp_s_geofence/presentation/task_views_screen/binding/task_views_binding.dart';
import 'package:afriyandi_jp_s_geofence/presentation/geofence_screen/geofence_screen.dart';
import 'package:afriyandi_jp_s_geofence/presentation/geofence_screen/binding/geofence_binding.dart';
import 'package:afriyandi_jp_s_geofence/presentation/location_screen/location_screen.dart';
import 'package:afriyandi_jp_s_geofence/presentation/location_screen/binding/location_binding.dart';
import 'package:afriyandi_jp_s_geofence/presentation/search_screen/search_screen.dart';
import 'package:afriyandi_jp_s_geofence/presentation/search_screen/binding/search_binding.dart';
import 'package:afriyandi_jp_s_geofence/presentation/user_account_screen/user_account_screen.dart';
import 'package:afriyandi_jp_s_geofence/presentation/user_account_screen/binding/user_account_binding.dart';
import 'package:afriyandi_jp_s_geofence/presentation/splash_screen/splash_screen.dart';
import 'package:afriyandi_jp_s_geofence/presentation/splash_screen/binding/splash_binding.dart';
import 'package:afriyandi_jp_s_geofence/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:afriyandi_jp_s_geofence/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String taskListScreen = '/task_list_screen';

  static const String emailLoginScreen = '/email_login_screen';

  static const String mapSettingsScreen = '/map_settings_screen';

  static const String mapScreen = '/map_screen';

  static const String taskAllocatorScreen = '/task_allocator_screen';

  static const String taskViewsScreen = '/task_views_screen';

  static const String geofenceScreen = '/geofence_screen';

  static const String locationScreen = '/location_screen';

  static const String searchScreen = '/search_screen';

  static const String userAccountScreen = '/user_account_screen';

  static const String splashScreen = '/splash_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: taskListScreen,
      page: () => TaskListScreen(),
      bindings: [
        TaskListBinding(),
      ],
    ),
    GetPage(
      name: emailLoginScreen,
      page: () => EmailLoginScreen(),
      bindings: [
        EmailLoginBinding(),
      ],
    ),
    GetPage(
      name: mapSettingsScreen,
      page: () => MapSettingsScreen(),
      bindings: [
        MapSettingsBinding(),
      ],
    ),
    GetPage(
      name: mapScreen,
      page: () => MapScreen(),
      bindings: [
        MapBinding(),
      ],
    ),
    GetPage(
      name: taskAllocatorScreen,
      page: () => TaskAllocatorScreen(),
      bindings: [
        TaskAllocatorBinding(),
      ],
    ),
    GetPage(
      name: taskViewsScreen,
      page: () => TaskViewsScreen(),
      bindings: [
        TaskViewsBinding(),
      ],
    ),
    GetPage(
      name: geofenceScreen,
      page: () => GeofenceScreen(),
      bindings: [
        GeofenceBinding(),
      ],
    ),
    GetPage(
      name: locationScreen,
      page: () => LocationScreen(),
      bindings: [
        LocationBinding(),
      ],
    ),
    GetPage(
      name: searchScreen,
      page: () => SearchScreen(),
      bindings: [
        SearchBinding(),
      ],
    ),
    GetPage(
      name: userAccountScreen,
      page: () => UserAccountScreen(),
      bindings: [
        UserAccountBinding(),
      ],
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
