class BatteryInfo {
  final int level;
  final bool isCharging;
  final int elapsedMs;

  BatteryInfo({
    required this.level,
    required this.isCharging,
    required this.elapsedMs,
  });
}
