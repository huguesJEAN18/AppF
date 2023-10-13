import 'package:fut_app/home_page/home_controller.dart';
import 'package:get/instance_manager.dart';


class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
