import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonColor extends StatefulWidget {
  const ButtonColor({super.key});

  @override
  State<ButtonColor> createState() => _ButtonColorState();
}

class _ButtonColorState extends State<ButtonColor> {
  int textNumber = 0;
  bool isGreen = false;

  void updateButton() {
    setState(() {
      textNumber++;
      isGreen = !isGreen;
    });
    Get.offAndToNamed('/home', arguments: {
      "championId": 345,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.offAndToNamed('/home'),
      child: Container(
        color: isGreen ? Colors.green : Colors.red,
        child: Text("Text $textNumber"),
      ),
    );
  }
}
