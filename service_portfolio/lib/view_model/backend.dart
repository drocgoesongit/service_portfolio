import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UL;

class Utils {
  static Future<void> sendEmail(
      {required String email, String subject = "", String body = ""}) async {
    Uri mail = Uri.parse(
        "mailto:$email?subject=$subject&body=${Uri.encodeFull(body)}");
    if (await UL.canLaunchUrl(mail)) {
      await UL.launchUrl(mail);
    } else {
      throw Exception("Unable to open the email");
    }
  }
}

enum ScreenType { Mobile, Web }

class ScreenLayout extends ChangeNotifier {
  ScreenType _screenType = ScreenType.Mobile;

  ScreenType get screenType => _screenType;

  void updateScreenType(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 600) {
      _screenType = ScreenType.Web;
    } else {
      _screenType = ScreenType.Mobile;
    }
    notifyListeners();
  }
}
