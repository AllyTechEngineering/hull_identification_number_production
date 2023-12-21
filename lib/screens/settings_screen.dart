import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utilities/responsive_adaptive_class.dart';
import '../utilities/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ResponsiveAdaptiveClass responsiveAdaptiveClass = ResponsiveAdaptiveClass();
  late final UrlLauncher urlLauncher;
  @override
  Widget build(BuildContext context) {
    responsiveAdaptiveClass.orientation = MediaQuery.of(context).orientation;
    responsiveAdaptiveClass.size = MediaQuery.of(context).size;
    responsiveAdaptiveClass.height = responsiveAdaptiveClass.size.height;
    responsiveAdaptiveClass.width = responsiveAdaptiveClass.size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
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
            'About',
            style: TextStyle(
                fontSize: responsiveAdaptiveClass.appBarTitleFontSize =
                    responsiveAdaptiveClass.selectAppBarTitleFontSize(1.0)),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/ocean_background.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 1.0,
              image: AssetImage('assets/images/ocean_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Container(
                  width: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonWidth(1),
                  height: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonHeight(1.2),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF2D9596),
                        Color(0xFF265073),
                      ],
                      stops: [0.0, 0.8],
                    ),
                    // color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _launchURLBrowser('https://www.linkedin.com/in/bob-taylor-mscs-mba/');
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        // fixedSize: Size((width * 0.75), (height / 5.5)),
                        fixedSize: Size(
                            responsiveAdaptiveClass.elevatedButtonWidth =
                                responsiveAdaptiveClass.selectElevatedButtonWidth(1),
                            responsiveAdaptiveClass.elevatedButtonHeight =
                                responsiveAdaptiveClass.selectElevatedButtonHeight(1.2)),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 3.0, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        backgroundColor: Colors.transparent),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Bob Taylor LinkedIn',
                        style: TextStyle(
                            fontSize: responsiveAdaptiveClass.classFontSize =
                                responsiveAdaptiveClass.selectFontSize(1.0),
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonWidth(1),
                  height: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonHeight(1),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF2D9596),
                        Color(0xFF265073),
                      ],
                      stops: [0.0, 0.8],
                    ),
                    // color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _launchURLBrowser('https://github.com/AllyTechEngineering/');
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        // fixedSize: Size((width * 0.75), (height / 5.5)),
                        fixedSize: Size(
                            responsiveAdaptiveClass.elevatedButtonWidth =
                                responsiveAdaptiveClass.selectElevatedButtonWidth(1),
                            responsiveAdaptiveClass.elevatedButtonHeight =
                                responsiveAdaptiveClass.selectElevatedButtonHeight(1.2)),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 3.0, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        backgroundColor: Colors.transparent),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Bob Taylor Portfolio',
                        style: TextStyle(
                            fontSize: responsiveAdaptiveClass.classFontSize =
                                responsiveAdaptiveClass.selectFontSize(1.0),
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonWidth(1),
                  height: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonHeight(1.2),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF2D9596),
                        Color(0xFF265073),
                      ],
                      stops: [0.0, 0.8],
                    ),
                    // color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _launchURLBrowser('https://allytechllc.com/privacy');
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        // fixedSize: Size((width * 0.75), (height / 5.5)),
                        fixedSize: Size(
                            responsiveAdaptiveClass.elevatedButtonWidth =
                                responsiveAdaptiveClass.selectElevatedButtonWidth(1),
                            responsiveAdaptiveClass.elevatedButtonHeight =
                                responsiveAdaptiveClass.selectElevatedButtonHeight(1.2)),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 3.0, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        backgroundColor: Colors.transparent),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Privacy Policy & \nCopyright 2023-2024',
                        style: TextStyle(
                            fontSize: responsiveAdaptiveClass.classFontSize =
                                responsiveAdaptiveClass.selectFontSize(1.0),
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonWidth(1),
                  height: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonHeight(1.3),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF2D9596),
                        Color(0xFF265073),
                      ],
                      stops: [0.0, 0.8],
                    ),
                    // color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _launchURLBrowser(
                          'https://apps.apple.com/us/app/boat-hin-decoder/id6474098761');
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        // fixedSize: Size((width * 0.75), (height / 5.5)),
                        fixedSize: Size(
                            responsiveAdaptiveClass.elevatedButtonWidth =
                                responsiveAdaptiveClass.selectElevatedButtonWidth(1),
                            responsiveAdaptiveClass.elevatedButtonHeight =
                                responsiveAdaptiveClass.selectElevatedButtonHeight(1.4)),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 3.0, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        backgroundColor: Colors.transparent),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Other Apps by the Developer:\nHIN Decoder App',
                        style: TextStyle(
                            fontSize: responsiveAdaptiveClass.classFontSize =
                                responsiveAdaptiveClass.selectFontSize(1.0),
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonWidth(1),
                  height: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonHeight(1.2),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF2D9596),
                        Color(0xFF265073),
                      ],
                      stops: [0.0, 0.8],
                    ),
                    // color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _launchURLBrowser(
                          'https://apps.apple.com/us/app/sailboat-racing-signals/id6474488492');
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        // fixedSize: Size((width * 0.75), (height / 5.5)),
                        fixedSize: Size(
                            responsiveAdaptiveClass.elevatedButtonWidth =
                                responsiveAdaptiveClass.selectElevatedButtonWidth(1),
                            responsiveAdaptiveClass.elevatedButtonHeight =
                                responsiveAdaptiveClass.selectElevatedButtonHeight(1.4)),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 3.0, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        backgroundColor: Colors.transparent),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Other Apps by the Developer:\nSailboat Racing Signals',
                        style: TextStyle(
                            fontSize: responsiveAdaptiveClass.classFontSize =
                                responsiveAdaptiveClass.selectFontSize(1.0),
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonWidth(1),
                  height: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonHeight(1.4),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF2D9596),
                        Color(0xFF265073),
                      ],
                      stops: [0.0, 0.8],
                    ),
                    // color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _launchURLBrowser(
                          'https://apps.apple.com/us/app/real-time-wind-report-sailing/id6450426585');
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        // fixedSize: Size((width * 0.75), (height / 5.5)),
                        fixedSize: Size(
                            responsiveAdaptiveClass.elevatedButtonWidth =
                                responsiveAdaptiveClass.selectElevatedButtonWidth(1),
                            responsiveAdaptiveClass.elevatedButtonHeight =
                                responsiveAdaptiveClass.selectElevatedButtonHeight(1.4)),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 3.0, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        backgroundColor: Colors.transparent),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Other Apps by the Developer:\nReal Time Wind Report Sailing',
                        style: TextStyle(
                            fontSize: responsiveAdaptiveClass.classFontSize =
                                responsiveAdaptiveClass.selectFontSize(1.0),
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonWidth(1),
                  height: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonHeight(1.4),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF2D9596),
                        Color(0xFF265073),
                      ],
                      stops: [0.0, 0.8],
                    ),
                    // color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _launchURLBrowser(
                          'https://apps.apple.com/us/app/sunfish-sailboat-basic-rigging/id6466507022');
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        // fixedSize: Size((width * 0.75), (height / 5.5)),
                        fixedSize: Size(
                            responsiveAdaptiveClass.elevatedButtonWidth =
                                responsiveAdaptiveClass.selectElevatedButtonWidth(1),
                            responsiveAdaptiveClass.elevatedButtonHeight =
                                responsiveAdaptiveClass.selectElevatedButtonHeight(1.4)),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 3.0, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        backgroundColor: Colors.transparent),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Other Apps by the Developer:\nSunfish Sailboat Basic Rigging',
                        style: TextStyle(
                            fontSize: responsiveAdaptiveClass.classFontSize =
                                responsiveAdaptiveClass.selectFontSize(1.0),
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _launchURLBrowser(String urlValue) async {
    var url = Uri.parse(urlValue);
    if (await canLaunchUrl(url)) {
      debugPrint('Inside of if means canLaunchUrl ok');
      await launchUrl(url);
    } else {
      debugPrint('After the else means an error: $url');
      throw 'Could not launch $url';
    } //else
  } //_launchURLBrowser
} //class
