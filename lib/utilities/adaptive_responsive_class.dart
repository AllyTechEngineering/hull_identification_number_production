import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'constants.dart';

class AdaptiveResponsiveClass {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  static Map<String, dynamic> androidDataValuesMap = <String, dynamic>{};
  static Map<String, dynamic> deviceDataValues = <String, dynamic>{};
  static double? androidDisplayInchesValue = 0.0;
  static double? androidDisplayWidthPixelsValue = 0.0;
  static double? androidDisplayHeightPixelsValue = 0.0;
  static double? afterDelayAndroidDisplayInchesValue = 0.0;
  static double? getAndroidDisplayInchesValue = 0.0;
  void getPlatformTypeMethod() {
    if (Platform.isIOS) {
      debugPrint('Platform is iOS');
    } else if (Platform.isAndroid) {
      debugPrint('Platform is Android');
    } else if (Platform.isMacOS) {
      debugPrint('Platform is Android');
    } else if (Platform.isLinux) {
      debugPrint('Platform is Android');
    } else if (Platform.isWindows) {
      debugPrint('Platform is Android');
    } else if (kIsWeb){
      debugPrint('Platform is Web');
    }
  }

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};
    try {
      if (kIsWeb) {
        deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        deviceData = switch (defaultTargetPlatform) {
          TargetPlatform.android => readAndroidBuildData(await deviceInfoPlugin.androidInfo),
          TargetPlatform.iOS => _readIosDeviceInfo(await deviceInfoPlugin.iosInfo),
          TargetPlatform.linux => _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo),
          TargetPlatform.windows => _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo),
          TargetPlatform.macOS => _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo),
          TargetPlatform.fuchsia => <String, dynamic>{
              'Error:': 'Fuchsia platform isn\'t supported'
            },
        };
      }
    } on PlatformException {
      deviceData = <String, dynamic>{'Error:': 'Failed to get platform version.'};
    }
    deviceDataValues = deviceData;
    androidDisplayInchesValue = deviceDataValues['displaySizeInches'];
    androidDisplayWidthPixelsValue = deviceDataValues['displayWidthPixels'];
    androidDisplayHeightPixelsValue = deviceDataValues['displayHeightPixels'];
  }

  Map<String, dynamic> readAndroidBuildData(AndroidDeviceInfo build) {
    androidDataValuesMap = {
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
      'displaySizeInches': ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      'displayWidthPixels': build.displayMetrics.widthPx,
      'displayWidthInches': build.displayMetrics.widthInches,
      'displayHeightPixels': build.displayMetrics.heightPx,
      'displayHeightInches': build.displayMetrics.heightInches,
      'displayXDpi': build.displayMetrics.xDpi,
      'displayYDpi': build.displayMetrics.yDpi,
      'serialNumber': build.serialNumber,
    };
    return androidDataValuesMap;
  }

  Map<String, dynamic> readIndividualAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'serialNumber': build.serialNumber,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'version': data.version,
      'id': data.id,
      'idLike': data.idLike,
      'versionCodename': data.versionCodename,
      'versionId': data.versionId,
      'prettyName': data.prettyName,
      'buildId': data.buildId,
      'variant': data.variant,
      'variantId': data.variantId,
      'machineId': data.machineId,
    };
  }

  Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': describeEnum(data.browserName),
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }

  Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
    return <String, dynamic>{
      'computerName': data.computerName,
      'hostName': data.hostName,
      'arch': data.arch,
      'model': data.model,
      'kernelVersion': data.kernelVersion,
      'majorVersion': data.majorVersion,
      'minorVersion': data.minorVersion,
      'patchVersion': data.patchVersion,
      'osRelease': data.osRelease,
      'activeCPUs': data.activeCPUs,
      'memorySize': data.memorySize,
      'cpuFrequency': data.cpuFrequency,
      'systemGUID': data.systemGUID,
    };
  }

  Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
    return <String, dynamic>{
      'numberOfCores': data.numberOfCores,
      'computerName': data.computerName,
      'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
      'userName': data.userName,
      'majorVersion': data.majorVersion,
      'minorVersion': data.minorVersion,
      'buildNumber': data.buildNumber,
      'platformId': data.platformId,
      'csdVersion': data.csdVersion,
      'servicePackMajor': data.servicePackMajor,
      'servicePackMinor': data.servicePackMinor,
      'suitMask': data.suitMask,
      'productType': data.productType,
      'reserved': data.reserved,
      'buildLab': data.buildLab,
      'buildLabEx': data.buildLabEx,
      'digitalProductId': data.digitalProductId,
      'displayVersion': data.displayVersion,
      'editionId': data.editionId,
      'installDate': data.installDate,
      'productId': data.productId,
      'productName': data.productName,
      'registeredOwner': data.registeredOwner,
      'releaseId': data.releaseId,
      'deviceId': data.deviceId,
    };
  }



  Future<double?> getAndroidDisplayInchesValueMethod() async {
    await initPlatformState();
    return androidDisplayInchesValue;
  }

  Future<double?> getAndroidDisplayWidthPixelsValueMethod() async {
    await initPlatformState();
    return androidDisplayWidthPixelsValue;
  }

  Future<double?> getAndroidDisplayHeightPixelsValueMethod() async {
    await initPlatformState();
    return androidDisplayHeightPixelsValue;
  }

  double calculateButtonWidth(BuildContext context) {
    getAndroidDisplayInchesValueMethod();
    double adjustedButtonWidth = 10.0;
    // devicePixelRatioValue is the number of device pixels for each logical pixel.
    dynamic devicePixelRatioValue = MediaQuery.of(context).devicePixelRatio;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;
    double androidDeviceActualPixelWidth = (devicePixelRatioValue * width);
    double androidDeviceActualPixelHeight = (devicePixelRatioValue * height);

    //debugPrint('in calc button androidDisplaySizeChoiceValue: $androidDisplaySizeChoiceValue');
    if (Platform.isIOS) {
      // iPhones: 320 w x 568 h
      // iPhone SE 1st gen
      // iPhone 5C
      // iPhone 5S
      // iPhone 5
      double iPhone320x568portraitWidth = 320;
      double iPhone320x568landscapeWidth = 568;
      if ((orientation == Orientation.portrait) && (width == 320 && height == 568)) {
        adjustedButtonWidth = iPhone320x568portraitWidth * kElevatedButtonWidth;

        // debugPrint('in iPhones: 320 w x 568 height: $height\nwidth: $width');
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape && (width == 568 && height == 320)) {
        adjustedButtonWidth = iPhone320x568landscapeWidth * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }
      // iPhones: 375 w x 667 h
      // iPhone SE 3rd gen
      // iPhone SE 2nd gen
      // iPhone 8
      // iPhone 7
      // iPhone 6s
      // iPhone 6
      double iPhone375x667portrait = 375.0;
      double iPhone375x667landscape = 667.0;
      if ((orientation == Orientation.portrait) && (width == 375 && height == 667)) {
        adjustedButtonWidth = iPhone375x667portrait * kElevatedButtonWidth;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape && (width == 667 && height == 375)) {
        adjustedButtonWidth = iPhone375x667landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }
      // iPhones: 414 w x 736 h
      // iPhone 8 Plus
      // iPhone 7 Plus
      // iPhone 6s Plus
      // iPhone 6 Plus
      double iPhone414x736portrait = 414.0;
      double iPhone414x736landscape = 736.0;
      if ((orientation == Orientation.portrait) && (width == 414 && height == 736)) {
        adjustedButtonWidth = iPhone414x736portrait * kElevatedButtonWidth;
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && (width == 736 && height == 414)) {
        adjustedButtonWidth = iPhone414x736landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }
      //  iPhones: 375 w x 812 h
      // iPhone 13 mini
      // iPhone 12 mini
      // iPhone 11 Pro
      // iPhone XS
      // iPhone X
      double iPhone375x812portrait = 375.0;
      double iPhone375x812landscape = 812.0;
      if ((orientation == Orientation.portrait) && (width == 375 && height == 812)) {
        adjustedButtonWidth = iPhone375x812portrait * kElevatedButtonWidth;
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && (width == 812 && height == 375)) {
        adjustedButtonWidth = iPhone375x812landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }
      // iPhones: 390 w x 844 h
      // iPhone 14
      // iPhone 13
      // iPhone 13 Pro
      // iPhone 12
      // iPhone 12 Pro
      double iPhone390x844portrait = 390.0;
      double iPhone390x844landscape = 844.0;
      if ((orientation == Orientation.portrait) && ((width == 390) && (height == 844))) {
        adjustedButtonWidth = iPhone390x844portrait * kElevatedButtonWidth;
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && ((width == 844) && (height == 390))) {
        adjustedButtonWidth = iPhone390x844landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }
      // iPhones: 393 w x 852 h
      // iPhone 15 Pro
      // iPhone 15
      // iPhone 14 Pro
      double iPhone393x852portrait = 393.0;
      double iPhone393x852landscape = 852.0;
      if ((orientation == Orientation.portrait) && ((width == 393) && (height == 852))) {
        // debugPrint(
        //     'in else portrait: iPhones: 430 w x 932 h\nadjustedFontSize = $adjustedFontSize');
        adjustedButtonWidth = iPhone393x852portrait * kElevatedButtonWidth;
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && ((width == 852) && (height == 393))) {
        // debugPrint('in else landscape: iPhones: 852 w x 393 h');
        adjustedButtonWidth = iPhone393x852landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }
      // iPhones: 414 w x 896 h
      // iPhone 11 Pro Max
      // iPhone 11
      // iPhone XR
      // iPhone XS Max
      double iPhone414x896portrait = 414.0;
      double iPhone414x896landscape = 896.0;
      if ((orientation == Orientation.portrait) && ((width == 414) && (height == 896))) {
        adjustedButtonWidth = iPhone414x896portrait * kElevatedButtonWidth;
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && ((width == 896) && (height == 414))) {
        adjustedButtonWidth = iPhone414x896landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }
      // iPhones: 428 w x 926 h
      // iPhone 14 Plus
      // iPhone 13 Pro Max
      // iPhone 12 Pro Max
      double iPhone428x926portrait = 428.0;
      double iPhone428x926landscape = 926.0;
      if ((orientation == Orientation.portrait) && ((width == 428) && (height == 926))) {
        adjustedButtonWidth = iPhone428x926portrait * kElevatedButtonWidth;
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && ((width == 926) && (height == 428))) {
        adjustedButtonWidth = iPhone428x926landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }
      // iPhones: 430 w x 932 h
      // iPhone 15 Pro Max
      // iPhone 15 Plus
      // iPhone 14 Pro Max
      double iPhone430x932portrait = 430.0;
      double iPhone430x932landscape = 932.0;
      if ((orientation == Orientation.portrait) && ((width == 430) && (height == 932))) {
        adjustedButtonWidth = iPhone430x932portrait * kElevatedButtonWidth;
        //debugPrint('in iPhone430x932portrait adjustedButtonWidth =$adjustedButtonWidth');
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && ((width == 932) && (height == 430))) {
        adjustedButtonWidth = iPhone430x932landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }

      // Generic iPad width
      if ((orientation == Orientation.portrait) && ((height >= 1024))) {
        adjustedButtonWidth = height * 0.6;
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && ((height >= 744))) {
        adjustedButtonWidth = height * 0.6;
        return adjustedButtonWidth;
      } else {
        // default font size
        return adjustedButtonWidth = 12.0;
      }
    }
    if (Platform.isMacOS) {
      //  MacOS loaded default 800 w x 600 h
      //debugPrint('In macOS orientation = $orientation');
      // double macOSportrait = 1600.0;
      // double macOSlandscape = 1200.0;
      if (((orientation == Orientation.landscape) || (orientation == Orientation.portrait)) &&
          ((width <= 430))) {
        adjustedButtonWidth = width * 0.6;
        return adjustedButtonWidth;
      } else if (((orientation == Orientation.landscape) ||
              (orientation == Orientation.portrait)) &&
          ((width >= 430))) {
        // debugPrint('in if ((orientation == Orientation.landscape) (width >= 430): $width ');
        adjustedButtonWidth = width * 0.6;
        return adjustedButtonWidth;
      } else {
        // default font size
        return adjustedButtonWidth = 12.0;
      }
    }
    if (Platform.isAndroid) {
      // Portrait adjustedButtonWidth
      debugPrint('androidDisplayInchesValue: $afterDelayAndroidDisplayInchesValue');
      if (orientation == Orientation.portrait) {
        if ((androidDeviceActualPixelWidth >= 400 && androidDeviceActualPixelWidth <= 499)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.60;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 500 && androidDeviceActualPixelWidth <= 599)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 600 && androidDeviceActualPixelWidth <= 699)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 700 && androidDeviceActualPixelWidth <= 799)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.45;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth == 800.0 &&
            androidDeviceActualPixelHeight == 1211.0)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.8;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth == 800.0000000000001 &&
            androidDeviceActualPixelHeight == 1247.0)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.8;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 800 &&
            androidDeviceActualPixelWidth <= 899 &&
            androidDeviceActualPixelHeight != 1211.0 &&
            androidDeviceActualPixelHeight != 1247.0)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.55;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth == 800.0 &&
            androidDeviceActualPixelHeight == 1211.0)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.8;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 900 && androidDeviceActualPixelWidth <= 999)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1000 &&
            androidDeviceActualPixelWidth <= 1099)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.35;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1100 &&
            androidDeviceActualPixelWidth <= 1199)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1200 &&
            androidDeviceActualPixelWidth <= 1299)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.65;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1300 &&
            androidDeviceActualPixelWidth <= 1399)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth == 1440.0 &&
            androidDeviceActualPixelHeight == 2214.0)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.6;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1400 &&
            androidDeviceActualPixelWidth <= 1499 &&
            androidDeviceActualPixelHeight != 2214.0)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.30;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1500 &&
            androidDeviceActualPixelWidth <= 1599)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1600 &&
            androidDeviceActualPixelWidth <= 1699)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1700 &&
            androidDeviceActualPixelWidth <= 1799)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1800 &&
            androidDeviceActualPixelWidth <= 1899)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        }
      }
      // Landscape adjustedButtonWidth
      if (orientation == Orientation.landscape) {
        // debugPrint(
        //     'Landscape button width androidDeviceActualPixelWidth: $androidDeviceActualPixelWidth');
        if ((androidDeviceActualPixelWidth >= 400 && androidDeviceActualPixelWidth <= 499)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 500 && androidDeviceActualPixelWidth <= 599)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 600 && androidDeviceActualPixelWidth <= 699)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 700 && androidDeviceActualPixelWidth <= 799)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 800 && androidDeviceActualPixelWidth <= 899)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.60;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 900 && androidDeviceActualPixelWidth <= 999)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1000 &&
            androidDeviceActualPixelWidth <= 1099)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth == 1125.0 &&
            androidDeviceActualPixelWidth == 1920.0)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.75;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1100 &&
            androidDeviceActualPixelHeight <= 1199 &&
            androidDeviceActualPixelWidth != 1920.0)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.65;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth == 1279 &&
            androidDeviceActualPixelHeight == 732)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.65;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth == 1280 &&
            androidDeviceActualPixelHeight == 767.0000000000001)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.65;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1200 &&
            androidDeviceActualPixelWidth <= 1299 &&
            androidDeviceActualPixelHeight != 732 &&
            androidDeviceActualPixelHeight != 767.0000000000001)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.45;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1300 &&
            androidDeviceActualPixelWidth <= 1399)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1400 &&
            androidDeviceActualPixelWidth <= 1499)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.30;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1500 &&
            androidDeviceActualPixelWidth <= 1599)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1600 &&
            androidDeviceActualPixelWidth <= 1699)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1700 &&
            androidDeviceActualPixelWidth <= 1799)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1800 &&
            androidDeviceActualPixelWidth <= 1899)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1900 &&
            androidDeviceActualPixelWidth <= 1999)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.35;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth == 2000.0 &&
            androidDeviceActualPixelHeight == 1117.0)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.7;
          //debugPrint('Success');
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 2000 &&
            androidDeviceActualPixelWidth <= 2099 &&
            androidDeviceActualPixelHeight != 1117.0)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.5;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 2100 &&
            androidDeviceActualPixelWidth <= 2199)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.35;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 2200 &&
            androidDeviceActualPixelWidth <= 2299)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.34;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 2300 &&
            androidDeviceActualPixelWidth <= 2399)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.45;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 2400 &&
            androidDeviceActualPixelWidth <= 2499)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 2500 &&
            androidDeviceActualPixelWidth <= 2599)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 2600 &&
            androidDeviceActualPixelWidth <= 2699)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 2700 &&
            androidDeviceActualPixelWidth <= 2799)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 2800 &&
            androidDeviceActualPixelWidth <= 2899)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 2900 &&
            androidDeviceActualPixelWidth <= 2999)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 3000 &&
            androidDeviceActualPixelWidth <= 3099)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 3100 &&
            androidDeviceActualPixelWidth <= 3199)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.30;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 3200 &&
            androidDeviceActualPixelWidth <= 3299)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        }
      }
    }
    return adjustedButtonWidth;
  }

  double calculateButtonHeight(BuildContext context) {
    double adjustedButtonHeight = 10.0;
    // devicePixelRatioValue is the number of device pixels for each logical pixel.
    dynamic devicePixelRatioValue = MediaQuery.of(context).devicePixelRatio;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;
    dynamic androidDeviceActualPixelWidth = (devicePixelRatioValue * width);
    dynamic androidDeviceActualPixelHeight = (devicePixelRatioValue * height);
    if (Platform.isIOS) {
      // iPhones: 320 w x 568 h
      // iPhone SE 1st gen - simulator
      // iPhone 5C
      // iPhone 5S
      // iPhone 5
      double iPhone320x568portraitHeight = 568;
      double iPhone320x568landscapeHeight = 320.0;
      if ((orientation == Orientation.portrait) && (width == 320 && height == 568)) {
        adjustedButtonHeight = iPhone320x568portraitHeight * kElevatedButtonHeight;
        // debugPrint('in iPhones: 320 w x 568 height: $height\nwidth: $width');
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape && (width == 568 && height == 320)) {
        adjustedButtonHeight = iPhone320x568landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      // iPhones: 375 w x 667 h
      // iPhone SE 3rd gen
      // iPhone SE 2nd gen
      // iPhone 8 - simulator
      // iPhone 7
      // iPhone 6s
      // iPhone 6
      double iPhone375x667portraitHeight = 667.0;
      double iPhone375x667landscapeHeight = 375.0;
      if ((orientation == Orientation.portrait) && (width == 375 && height == 667)) {
        adjustedButtonHeight = iPhone375x667portraitHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape && (width == 667 && height == 375)) {
        adjustedButtonHeight = iPhone375x667landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      // iPhones: 414 w x 736 h
      // iPhone 8 Plus
      // iPhone 7 Plus
      // iPhone 6s Plus
      // iPhone 6 Plus
      double iPhone414x736portraitHeight = 736.0;
      double iPhone414x736landscapeHeight = 414.0;
      if ((orientation == Orientation.portrait) && (width == 414 && height == 736)) {
        adjustedButtonHeight = iPhone414x736portraitHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && (width == 736 && height == 414)) {
        adjustedButtonHeight = iPhone414x736landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      //  iPhones: 375 w x 812 h
      // iPhone 13 mini
      // iPhone 12 mini
      // iPhone 11 Pro - simulator
      // iPhone XS
      // iPhone X
      double iPhone375x812portraitHeight = 812.0;
      double iPhone375x812landscapeHeight = 375.0;
      if ((orientation == Orientation.portrait) && (width == 375 && height == 812)) {
        adjustedButtonHeight = iPhone375x812portraitHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && (width == 812 && height == 375)) {
        adjustedButtonHeight = iPhone375x812landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      // iPhones: 390 w x 844 h
      // iPhone 14
      // iPhone 13
      // iPhone 13 Pro
      // iPhone 12
      // iPhone 12 Pro
      double iPhone390x844portraitHeight = 844.0;
      double iPhone390x844landscapeHeight = 390.0;
      if ((orientation == Orientation.portrait) && ((width == 390) && (height == 844))) {
        adjustedButtonHeight = iPhone390x844portraitHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && ((width == 844) && (height == 390))) {
        adjustedButtonHeight = iPhone390x844landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      // iPhones: 393 w x 852 h
      // iPhone 15 Pro - simulator
      // iPhone 15
      // iPhone 14 Pro
      double iPhone393x852portraitHeight = 852.0;
      double iPhone393x852landscapeHeight = 393.0;
      if ((orientation == Orientation.portrait) && ((width == 393) && (height == 852))) {
        // debugPrint('in else portrait: iPhones: 393 w x 852 h = \nadjustedFontSize = $adjustedButtonHeight');
        adjustedButtonHeight = iPhone393x852portraitHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && ((width == 852) && (height == 393))) {
        debugPrint('in else landscape: iPhones: 393 w x 852 h = \n$adjustedButtonHeight');
        adjustedButtonHeight = iPhone393x852landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      // iPhones: 414 w x 896 h
      // iPhone 11 Pro Max - simulator
      // iPhone 11
      // iPhone XR
      // iPhone XS Max
      double iPhone414x896portraitHeight = 896.0;
      double iPhone414x896landscapeHeight = 414.0;
      if ((orientation == Orientation.portrait) && ((width == 414) && (height == 896))) {
        adjustedButtonHeight = iPhone414x896portraitHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && ((width == 896) && (height == 414))) {
        adjustedButtonHeight = iPhone414x896landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      // iPhones: 428 w x 926 h
      // iPhone 14 Plus - simulator
      // iPhone 13 Pro Max
      // iPhone 12 Pro Max
      double iPhone428x926portraitHeight = 926.0;
      double iPhone428x926landscapeHeight = 428.0;
      if ((orientation == Orientation.portrait) && ((width == 428) && (height == 926))) {
        adjustedButtonHeight = iPhone428x926portraitHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && ((width == 926) && (height == 428))) {
        adjustedButtonHeight = iPhone428x926landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      // iPhones: 430 w x 932 h
      // iPhone 15 Pro Max - simulator
      // iPhone 15 Plus
      // iPhone 14 Pro Max
      double iPhone430x932portraitHeight = 932.0;
      double iPhone430x932landscapeHeight = 430.0;

      if ((orientation == Orientation.portrait) && ((width == 430) && (height == 932))) {
        adjustedButtonHeight = iPhone430x932portraitHeight * kElevatedButtonHeight;
        // debugPrint('in iPhone430x932portrait adjustedButtonHeight =$adjustedButtonHeight');
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && ((width == 932) && (height == 430))) {
        adjustedButtonHeight = iPhone430x932landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }

      if ((orientation == Orientation.portrait) && ((width >= 744))) {
        adjustedButtonHeight = height * 0.1;
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && ((width >= 1024))) {
        adjustedButtonHeight = height * 0.1;
        return adjustedButtonHeight;
      } else {
        // default font size
        return adjustedButtonHeight = 30.0;
      }
    }
    if (Platform.isMacOS) {
      if (((orientation == Orientation.landscape) || (orientation == Orientation.portrait)) &&
          ((width <= 430))) {
        adjustedButtonHeight = height * 0.03;
        return adjustedButtonHeight;
      } else if (((orientation == Orientation.landscape) ||
              (orientation == Orientation.portrait)) &&
          ((width >= 430))) {
        adjustedButtonHeight = height * 0.10;
        return adjustedButtonHeight;
      } else {
        // default font size
        return adjustedButtonHeight = 30.0;
      }
    }
    if (Platform.isAndroid) {
      // Portrait adjustedButtonHeight
      if (orientation == Orientation.portrait) {
        if ((androidDeviceActualPixelHeight >= 400 && androidDeviceActualPixelHeight <= 499)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 500 &&
            androidDeviceActualPixelHeight <= 599)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 600 &&
            androidDeviceActualPixelHeight <= 699)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 700 &&
            androidDeviceActualPixelHeight <= 799)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.05;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 800 &&
            androidDeviceActualPixelHeight <= 899)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 900 &&
            androidDeviceActualPixelHeight <= 999)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1000 &&
            androidDeviceActualPixelHeight <= 1099)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1100 &&
            androidDeviceActualPixelHeight <= 1199)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight == 1211 &&
            androidDeviceActualPixelWidth == 800)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.065;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight == 1247 &&
            androidDeviceActualPixelWidth == 800.0000000000001)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.065;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1200 &&
            androidDeviceActualPixelHeight <= 1299 &&
            androidDeviceActualPixelWidth != 800 &&
            androidDeviceActualPixelWidth != 800.0000000000001)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.039;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1300 &&
            androidDeviceActualPixelHeight <= 1399)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1400 &&
            androidDeviceActualPixelHeight <= 1499)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1500 &&
            androidDeviceActualPixelHeight <= 1599)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1600 &&
            androidDeviceActualPixelHeight <= 1699)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1700 &&
            androidDeviceActualPixelHeight <= 1799)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight == 1845.0 &&
            androidDeviceActualPixelWidth == 1200.0)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.055;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1800 &&
            androidDeviceActualPixelHeight <= 1899 &&
            androidDeviceActualPixelWidth != 1200.0)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.035;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight == 1917.0 &&
            androidDeviceActualPixelWidth == 1200.0)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.065;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1900 &&
            androidDeviceActualPixelHeight <= 1999 &&
            androidDeviceActualPixelWidth != 1200.0)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2000 &&
            androidDeviceActualPixelHeight <= 2099)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2100 &&
            androidDeviceActualPixelHeight <= 2199)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.030;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight == 2214.0 &&
            androidDeviceActualPixelWidth == 1440.0)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.045;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2200 &&
            androidDeviceActualPixelHeight <= 2299 &&
            androidDeviceActualPixelWidth != 1440.0)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.035;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2300 &&
            androidDeviceActualPixelHeight <= 2399)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2400 &&
            androidDeviceActualPixelHeight <= 2499)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2500 &&
            androidDeviceActualPixelHeight <= 2599)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2600 &&
            androidDeviceActualPixelHeight <= 2699)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2700 &&
            androidDeviceActualPixelHeight <= 2799)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2800 &&
            androidDeviceActualPixelHeight <= 2899)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2900 &&
            androidDeviceActualPixelHeight <= 2999)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 3000 &&
            androidDeviceActualPixelHeight <= 3099)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 3100 &&
            androidDeviceActualPixelHeight <= 3199)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 3200 &&
            androidDeviceActualPixelHeight <= 3299)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        }
      }
      // landscape adjustedButtonHeight
      if (orientation == Orientation.landscape) {
        if ((androidDeviceActualPixelHeight >= 400 && androidDeviceActualPixelHeight <= 499)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.10;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 500 &&
            androidDeviceActualPixelHeight <= 599)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 600 &&
            androidDeviceActualPixelHeight <= 699)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight == 732 &&
            androidDeviceActualPixelWidth == 1279)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.095;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight == 767.0000000000001 &&
            androidDeviceActualPixelWidth == 1280)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.09;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 700 &&
            androidDeviceActualPixelHeight <= 799 &&
            androidDeviceActualPixelWidth != 1279 &&
            androidDeviceActualPixelWidth != 1280)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.07;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 800 &&
            androidDeviceActualPixelHeight <= 899)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 900 &&
            androidDeviceActualPixelHeight <= 999)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1000 &&
            androidDeviceActualPixelHeight <= 1099)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.053;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight == 1117.0 &&
            androidDeviceActualPixelWidth == 2000.0)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.085;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight == 1125.0 &&
            androidDeviceActualPixelWidth == 1920.0)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.075;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1100 &&
            androidDeviceActualPixelHeight <= 1199 &&
            androidDeviceActualPixelWidth != 1920.0 &&
            androidDeviceActualPixelWidth != 2000.0)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.035;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1200 &&
            androidDeviceActualPixelHeight <= 1299)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight == 1350.0 &&
            androidDeviceActualPixelWidth == 2304.0)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.065;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1300 &&
            androidDeviceActualPixelHeight <= 1399 &&
            androidDeviceActualPixelWidth != 2304.0)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.055;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1400 &&
            androidDeviceActualPixelHeight <= 1499)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1500 &&
            androidDeviceActualPixelHeight <= 1599)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1600 &&
            androidDeviceActualPixelHeight <= 1699)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1700 &&
            androidDeviceActualPixelHeight <= 1799)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1800 &&
            androidDeviceActualPixelHeight <= 1899)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.10;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1900 &&
            androidDeviceActualPixelHeight <= 1999)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2000 &&
            androidDeviceActualPixelHeight <= 2099)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2100 &&
            androidDeviceActualPixelHeight <= 2199)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2200 &&
            androidDeviceActualPixelHeight <= 2299)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2300 &&
            androidDeviceActualPixelHeight <= 2399)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2400 &&
            androidDeviceActualPixelHeight <= 2499)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2500 &&
            androidDeviceActualPixelHeight <= 2599)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2600 &&
            androidDeviceActualPixelHeight <= 2699)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2700 &&
            androidDeviceActualPixelHeight <= 2799)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2800 &&
            androidDeviceActualPixelHeight <= 2899)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2900 &&
            androidDeviceActualPixelHeight <= 2999)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 3000 &&
            androidDeviceActualPixelHeight <= 3099)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 3100 &&
            androidDeviceActualPixelHeight <= 3199)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 3200 &&
            androidDeviceActualPixelHeight <= 3299)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        }
      }
    }
    return adjustedButtonHeight = 100.0;
  }
}
