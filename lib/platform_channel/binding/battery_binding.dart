import 'package:get/get.dart';
import 'package:use_case/platform_channel/services/battery_services.dart';
import 'package:use_case/platform_channel/viewmodels/battery_viewmodel.dart';


class BatteryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IBatteryService>(() => BatteryService());
    Get.lazyPut(() => BatteryViewmodel(Get.find()));
  }
}
