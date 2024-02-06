// package_info_util.dart

import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoUtil {
  static Future<String> getAppVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.version;
    } catch (e) {
      // Handle the error or log it as needed
      return '';
    }
  }
}
