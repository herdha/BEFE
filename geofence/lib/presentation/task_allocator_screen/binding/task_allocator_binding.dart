import '../controller/task_allocator_controller.dart';
import 'package:get/get.dart';

class TaskAllocatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskAllocatorController());
  }
}
