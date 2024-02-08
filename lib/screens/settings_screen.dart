import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:styled_text/styled_text.dart';
import '../models/buttons_data.dart';
import '../utilities/adaptive_responsive_class.dart';
import '../utilities/calculate_font_size_class.dart';
import '../utilities/package_info_util.dart';
import '../utilities/url_launcher.dart';
import '../widgets/background_decoration.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final CalculateFontSizeClass calculateFontSizeClass = CalculateFontSizeClass();
  final AdaptiveResponsiveClass adaptiveResponsiveClass = AdaptiveResponsiveClass();
  final UrlLauncher urlLauncher = UrlLauncher();
  dynamic orientation, size, height, width;
  double? sizeBoxHeight;
  double elevatedButtonWidth = 0.0;
  double elevatedButtonHeight = 0.0;
  dynamic devicePixelRatioValue;
  bool appTrackingTransparencyStatus = false;
  String appVersion = '';
  dynamic deviceInformationValues;

  @override
  void initState() {
    super.initState();
    _initPackageInfoPlus();
    _appPermissionHandler();
  }

  _initPackageInfoPlus() async {
    appVersion = await PackageInfoUtil.getAppVersion();
    // debugPrint(' App Ver: $appVersion\n');
    setState(() {
      appVersion = appVersion;
    });
  }

  void initMethod() {
    setState(() {
      devicePixelRatioValue = MediaQuery.of(context).devicePixelRatio;
      height = MediaQuery.of(context).size.height;
      width = MediaQuery.of(context).size.width;
      orientation = MediaQuery.of(context).orientation;
      elevatedButtonWidth = adaptiveResponsiveClass.calculateButtonWidth(context);
      elevatedButtonHeight = adaptiveResponsiveClass.calculateButtonHeight(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    initMethod();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
            ),
            onPressed: () => context.go('/'),
          ),
          centerTitle: true,
          title: Text(
            'About Us',
            style: Theme.of(context).textTheme.displayLarge,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
          flexibleSpace: Container(
            decoration: BackgroundDecoration.backgroundImageDecoration,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Ver: $appVersion',
                style: Theme.of(context).textTheme.displaySmall,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BackgroundDecoration.backgroundImageDecoration,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: buttonsData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: elevatedButtonWidth,
                      height: elevatedButtonHeight,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF4fb8db),
                            Color(0xFF176B87),
                          ],
                          stops: [0.0, 0.8],
                        ),
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          _cookieAlertRejectAccept(buttonsData[index]['url']!);
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 10.0,
                            fixedSize: Size(elevatedButtonWidth, elevatedButtonHeight),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1.0, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            backgroundColor: Colors.transparent),
                        child: Text(
                          buttonsData[index]['text']!,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _cookieAlertRejectAccept(String urlValue) {
    if (appTrackingTransparencyStatus == true) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: StyledText(
            text: '<bold>Entering a website that requires cookies</bold>',
            tags: {
              'bold': StyledTextTag(
                style: Theme.of(context).textTheme.titleSmall,
              ),
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                urlLauncher.launchURLBrowser(urlValue);
              },
              child: Container(
                color: Colors.greenAccent,
                padding: const EdgeInsets.all(14),
                child: const Text('Accept'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Container(
                color: Colors.redAccent,
                padding: const EdgeInsets.all(14),
                child: const Text('Reject'),
              ),
            ),
          ],
        ),
      );
    } else if (appTrackingTransparencyStatus == false) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: StyledText(
            text:
                '<bold>Disabled: go to Setting/Privacy & Security and enable app tracking in order to visit these websites.</bold>',
            tags: {
              'bold': StyledTextTag(
                style: Theme.of(context).textTheme.titleSmall,
              ),
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                // _launchURLBrowser(urlValue);
              },
              child: Container(
                color: Colors.greenAccent,
                padding: const EdgeInsets.all(14),
                child: const Text('Dismiss'),
              ),
            ),
          ],
        ),
      );
    }
  }

  void _appPermissionHandler() async {
    if (Platform.isMacOS || Platform.isAndroid) {
      appTrackingTransparencyStatus = true;
    } else if (Platform.isIOS) {
      var permissionRequest = await Permission.appTrackingTransparency.request();
      // debugPrint('permissionRequest = $permissionRequest');
      if (permissionRequest.isDenied) {
        appTrackingTransparencyStatus = false;
        // debugPrint('appTrackingTransparencyStatus 1 = $appTrackingTransparencyStatus');
      } else if (permissionRequest.isGranted) {
        appTrackingTransparencyStatus = true;
        // debugPrint('appTrackingTransparencyStatus 2 = $appTrackingTransparencyStatus');
      } else if (permissionRequest.isLimited) {
        appTrackingTransparencyStatus = false;
        // debugPrint('appTrackingTransparencyStatus 3 = $appTrackingTransparencyStatus');
      } else if (permissionRequest.isRestricted) {
        appTrackingTransparencyStatus = false;
        // debugPrint('appTrackingTransparencyStatus 4 = $appTrackingTransparencyStatus');
      } else if (permissionRequest.isProvisional) {
        appTrackingTransparencyStatus = false;
        // debugPrint('appTrackingTransparencyStatus 5 = $appTrackingTransparencyStatus');
      }
    }
  }
} //class
