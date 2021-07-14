import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_flutter_project/utils/globals.dart';

class DataController extends GetxController {
  final tempValue = 0.5.obs;
  final lightValue = true.obs;
  final coolerValue = true.obs;
  final doorValue = false.obs;

  // ignore: missing_return
  List<Color> changeView(String type) {
    switch (type) {
      case "light":
        if (lightValue.value)
          return [GlobalVal.box_yellow, GlobalVal.yellow];
        else
          return [GlobalVal.box_disabled, GlobalVal.disabled];
        break;
      default:
    }
  }
}
