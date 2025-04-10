import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/services.dart';

import '../models/battery_info.dart';

abstract class IBatteryService {
  Future<BatteryInfo> getBatteryInfoFromNative();
  Future<BatteryInfo> getBatteryInfoFromPackage();
}

class BatteryService implements IBatteryService {
  static const platform = MethodChannel('usecase/battery');

  @override
  Future<BatteryInfo> getBatteryInfoFromNative() async {
    final stopwatch = Stopwatch()..start();
    final result = await platform.invokeMethod<Map>('getBatteryInfo');
    stopwatch.stop();

    return BatteryInfo(
      level: result?['level'] ?? 0,
      isCharging: result?['charging'] == true,
      elapsedMs: stopwatch.elapsedMilliseconds,
    );
  }

  @override
  Future<BatteryInfo> getBatteryInfoFromPackage() async {
    final stopwatch = Stopwatch()..start();
    final battery = Battery();

    final level = await battery.batteryLevel;
    final state = await battery.batteryState;
    stopwatch.stop();

    return BatteryInfo(
      level: level,
      isCharging: state == BatteryState.charging,
      elapsedMs: stopwatch.elapsedMilliseconds,
    );
  }
}
