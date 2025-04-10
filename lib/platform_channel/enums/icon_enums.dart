import 'package:flutter/material.dart';

enum IconEnums
{
  charge(icon: Icons.bolt),
  power(icon:Icons.power_outlined),
  timer(icon: Icons.timer_outlined),
  code(icon: Icons.code);
  const IconEnums({
    required this.icon
  });
  final IconData icon;
}

extension IconExtension on IconEnums
{
    Widget get iconWidget => Icon(icon, color: Colors.black45,);
}