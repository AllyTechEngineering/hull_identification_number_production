import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  launchURLBrowser(String urlValue) async {
    var url = Uri.parse(urlValue);
    if (await canLaunchUrl(url)) {
      debugPrint('Inside of if means canLaunchUrl ok');
      await launchUrl(url);
    } else {
      debugPrint('After the else means an error: $url');
      throw 'Could not launch $url';
    } //else
  } //_launchURLBrowser
}
