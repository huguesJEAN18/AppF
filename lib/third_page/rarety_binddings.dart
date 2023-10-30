import 'package:fut_app/third_page/rarety_controller.dart';
import 'package:get/instance_manager.dart';

class RaretyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(RaretyController());
  }
}