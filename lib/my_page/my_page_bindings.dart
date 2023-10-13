import 'package:fut_app/my_page/my_page_controller.dart';
import 'package:get/instance_manager.dart';


class MyPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MyPageController());
  }
}
