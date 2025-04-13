// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';


abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const PLATFORMCHANNEL = _Paths.PLATFORMCHANNEL;
  static const SPEEDTRACER = _Paths.SPEEDTRACER;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const PLATFORMCHANNEL = '/platform-channel';
  static const SPEEDTRACER = '/speed-tracer';
}
