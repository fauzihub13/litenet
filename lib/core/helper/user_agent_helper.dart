import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UserAgentHelper {
  static Future<String> initUserAgentState() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String appVersion = packageInfo.version;

      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      String systemName = '-';

      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        systemName = 'Android ${androidInfo.version.release}'; // Contoh: Android 11
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        systemName = 'iOS ${iosInfo.systemVersion}'; // Contoh: iOS 15.3
      }

      String userAgent = 'Litenet Mobile/$appVersion ($systemName)';
      return userAgent;
    } catch (error) {
      return 'Litenet Mobile/<error>';
    }
  }
}
