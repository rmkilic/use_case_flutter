// bindings/location_binding.dart
import 'package:get/get.dart';
import 'package:use_case/speed_tracer/viewmodels/location_viewmodels.dart';


class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationViewModel>(() => LocationViewModel());
  }
}
