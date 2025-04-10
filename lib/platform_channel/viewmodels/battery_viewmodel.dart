import 'package:get/get.dart';
import 'package:use_case/platform_channel/services/battery_services.dart';

import '../models/battery_info.dart';


class BatteryViewmodel extends GetxController {
  final IBatteryService service;

  BatteryViewmodel(this.service);

  final Rxn<BatteryInfo> batteryInfo = Rxn<BatteryInfo>();
  final RxString status = "".obs;

  Future<void> fetchFromNative() async {
    status.value = "NATIVE call...";
    batteryInfo.value = await service.getBatteryInfoFromNative();
    status.value = "NATIVE";
  }

  Future<void> fetchFromPackage() async {
    status.value = "PACKAGE call...";
    batteryInfo.value = await service.getBatteryInfoFromPackage();
    status.value = "PACKAGE";
  }
}
