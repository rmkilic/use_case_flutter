// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:use_case/home_view.dart';
import 'package:use_case/platform_channel/binding/battery_binding.dart';
import 'package:use_case/platform_channel/views/battery/battery_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PLATFORMCHANNEL;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.PLATFORMCHANNEL,
      page: () => const  BatteryView(),
      binding: BatteryBinding(),
    ),

  ];
}
