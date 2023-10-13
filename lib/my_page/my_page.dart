import 'package:flutter/material.dart';
import 'package:fut_app/my_page/my_page_controller.dart';
import 'package:fut_app/my_page/widgets/button_color.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class MyPage extends GetView<MyPageController> {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ButtonColor(),
    );
  }
}
