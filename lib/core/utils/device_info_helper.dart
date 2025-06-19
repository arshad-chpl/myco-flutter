import 'package:flutter/services.dart';

mixin DeviceInfoHelper {
  static const platform = MethodChannel('com.myco.fhpl.deviceinfo');

  static Future<Map<String, String>> getDeviceInfo() async {
    try {
      final Map result = await platform.invokeMethod('getDeviceInfo');
      return {
        'manufacturer': result['manufacturer'] ?? 'Unknown',
        'model': result['model'] ?? 'Unknown',
        'osVersion': result['osVersion'] ?? 'Unknown',
      };
    } catch (e) {
      return {
        'manufacturer': 'Error',
        'model': 'Error',
        'osVersion': 'Error',
      };
    }
  }
}