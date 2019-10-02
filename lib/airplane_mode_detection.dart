import 'dart:async';

import 'package:flutter/services.dart';

class AirplaneModeDetection {
  static const MethodChannel _channel  =
  const MethodChannel('airplane_mode_detection');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool> detectAirplaneMode() async {
    final bool airplaneMode =  await _channel.invokeMethod('detectAirplaneMode');
    return airplaneMode;
  }

  static Future<bool> changeAirplaneMode() async {
    final bool airplaneMode = await _channel.invokeMethod('changeAirplaneMode');
    return airplaneMode;
  }
}
