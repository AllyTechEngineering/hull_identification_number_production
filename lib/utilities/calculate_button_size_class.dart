import 'package:flutter/material.dart';
import 'dart:io';

import 'constants.dart';

class CalculateButtonSizeClass {
  double calculateButtonWidth(BuildContext context) {
    double adjustedButtonWidth = 10.0;
    // devicePixelRatioValue is the number of device pixels for each logical pixel.
    dynamic devicePixelRatioValue = MediaQuery.of(context).devicePixelRatio;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;

    dynamic androidDeviceActualPixelWidth = (devicePixelRatioValue * width);
    dynamic androidDeviceActualPixelHeight = (devicePixelRatioValue * height);

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
        ;
        // debugPrint('in iPhones: 320 w x 568 height: $height\nwidth: $width');
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape && (width == 568 && height == 320)) {
        adjustedButtonWidth = iPhone320x568landscapeWidth * kElevatedButtonWidth;
        ;
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
        debugPrint('in iPhone430x932portrait adjustedButtonWidth =$adjustedButtonWidth');
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
      debugPrint('In macOS orientation = $orientation');
      // double macOSportrait = 1600.0;
      // double macOSlandscape = 1200.0;
      if (((orientation == Orientation.landscape) || (orientation == Orientation.portrait)) &&
          ((width <= 430))) {
        adjustedButtonWidth = width * 0.6;
        return adjustedButtonWidth;
      } else if (((orientation == Orientation.landscape) ||
              (orientation == Orientation.portrait)) &&
          ((width >= 430))) {
        debugPrint('in if ((orientation == Orientation.landscape) (width >= 430): $width ');
        adjustedButtonWidth = width * 0.6;
        return adjustedButtonWidth;
      } else {
        // default font size
        return adjustedButtonWidth = 12.0;
      }
    }
    if (Platform.isAndroid) {
      //portrait
      debugPrint(
          'Android device button width orientation: $orientation\nandroidDeviceActualPixelWidth: $androidDeviceActualPixelWidth\nandroidDeviceActualPixelHeight: $androidDeviceActualPixelHeight\nadjustedButtonWidth: $adjustedButtonWidth');
      if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelWidth >= 400 && androidDeviceActualPixelWidth <= 499)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.60;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelWidth >= 500 && androidDeviceActualPixelWidth <= 599)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelWidth >= 600 && androidDeviceActualPixelWidth <= 699)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelWidth >= 700 && androidDeviceActualPixelWidth <= 799)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.45;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelWidth >= 800 && androidDeviceActualPixelWidth <= 899)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.55;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelWidth >= 900 && androidDeviceActualPixelWidth <= 999)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelWidth >= 1000 && androidDeviceActualPixelWidth <= 1099)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.35;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelWidth >= 1100 && androidDeviceActualPixelWidth <= 1199)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelWidth >= 1200 && androidDeviceActualPixelWidth <= 1299)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelWidth >= 1300 && androidDeviceActualPixelWidth <= 1399)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelWidth >= 1400 && androidDeviceActualPixelWidth <= 1499)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.30;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelWidth >= 1500 && androidDeviceActualPixelWidth <= 1599)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelWidth >= 1600 && androidDeviceActualPixelWidth <= 1699)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelWidth >= 1700 && androidDeviceActualPixelWidth <= 1799)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelWidth >= 1800 && androidDeviceActualPixelWidth <= 1899)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      }
// landscape
      if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 400 && androidDeviceActualPixelWidth <= 499)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 500 && androidDeviceActualPixelWidth <= 599)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 600 && androidDeviceActualPixelWidth <= 699)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 700 && androidDeviceActualPixelWidth <= 799)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 800 && androidDeviceActualPixelWidth <= 899)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.60;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 900 && androidDeviceActualPixelWidth <= 999)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 1000 && androidDeviceActualPixelWidth <= 1099)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 1100 && androidDeviceActualPixelWidth <= 1199)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 1200 && androidDeviceActualPixelWidth <= 1299)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.45;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 1300 && androidDeviceActualPixelWidth <= 1399)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 1400 && androidDeviceActualPixelWidth <= 1499)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.30;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 1500 && androidDeviceActualPixelWidth <= 1599)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 1600 && androidDeviceActualPixelWidth <= 1699)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 1700 && androidDeviceActualPixelWidth <= 1799)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 1800 && androidDeviceActualPixelWidth <= 1899)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 1900 && androidDeviceActualPixelWidth <= 1999)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.35;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 2000 && androidDeviceActualPixelWidth <= 2099)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 2100 && androidDeviceActualPixelWidth <= 2199)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.35;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 2200 && androidDeviceActualPixelWidth <= 2299)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.34;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 2300 && androidDeviceActualPixelWidth <= 2399)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 2400 && androidDeviceActualPixelWidth <= 2499)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 2500 && androidDeviceActualPixelWidth <= 2599)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 2600 && androidDeviceActualPixelWidth <= 2699)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 2700 && androidDeviceActualPixelWidth <= 2799)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 2800 && androidDeviceActualPixelWidth <= 2899)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 2900 && androidDeviceActualPixelWidth <= 2999)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 3000 && androidDeviceActualPixelWidth <= 3099)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 3100 && androidDeviceActualPixelWidth <= 3199)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.30;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelWidth >= 3200 && androidDeviceActualPixelWidth <= 3299)) {
        adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
        return adjustedButtonWidth;
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
        debugPrint(
            'in else portrait: iPhones: 393 w x 852 h = \nadjustedFontSize = $adjustedButtonHeight');
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
        debugPrint('in iPhone430x932portrait adjustedButtonHeight =$adjustedButtonHeight');
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
      debugPrint(
          'Android device button width orientation: $orientation\nandroidDeviceActualPixelWidth: $androidDeviceActualPixelWidth\nandroidDeviceActualPixelHeight: $androidDeviceActualPixelHeight\nadjustedButtonWidth: $adjustedButtonHeight');
      if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 400 && androidDeviceActualPixelHeight <= 499)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 500 && androidDeviceActualPixelHeight <= 599)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 600 && androidDeviceActualPixelHeight <= 699)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 700 && androidDeviceActualPixelHeight <= 799)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.05;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 800 && androidDeviceActualPixelHeight <= 899)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 900 && androidDeviceActualPixelHeight <= 999)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 1000 && androidDeviceActualPixelHeight <= 1099)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 1100 && androidDeviceActualPixelHeight <= 1199)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 1200 && androidDeviceActualPixelHeight <= 1299)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.039;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 1300 && androidDeviceActualPixelHeight <= 1399)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 1400 && androidDeviceActualPixelHeight <= 1499)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 1500 && androidDeviceActualPixelHeight <= 1599)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 1600 && androidDeviceActualPixelHeight <= 1699)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 1700 && androidDeviceActualPixelHeight <= 1799)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 1800 && androidDeviceActualPixelHeight <= 1899)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.035;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 1900 && androidDeviceActualPixelHeight <= 1999)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 2000 && androidDeviceActualPixelHeight <= 2099)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 2100 && androidDeviceActualPixelHeight <= 2199)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.030;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 2200 && androidDeviceActualPixelHeight <= 2299)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.035;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 2300 && androidDeviceActualPixelHeight <= 2399)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 2400 && androidDeviceActualPixelHeight <= 2499)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 2500 && androidDeviceActualPixelHeight <= 2599)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 2600 && androidDeviceActualPixelHeight <= 2699)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 2700 && androidDeviceActualPixelHeight <= 2799)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 2800 && androidDeviceActualPixelHeight <= 2899)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 2900 && androidDeviceActualPixelHeight <= 2999)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 3000 && androidDeviceActualPixelHeight <= 3099)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 3100 && androidDeviceActualPixelHeight <= 3199)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.portrait &&
          (androidDeviceActualPixelHeight >= 3200 && androidDeviceActualPixelHeight <= 3299)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      }
// landscape
      if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 400 && androidDeviceActualPixelHeight <= 499)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.10;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 500 && androidDeviceActualPixelHeight <= 599)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 600 && androidDeviceActualPixelHeight <= 699)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 700 && androidDeviceActualPixelHeight <= 799)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.07;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 800 && androidDeviceActualPixelHeight <= 899)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 900 && androidDeviceActualPixelHeight <= 999)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 1000 && androidDeviceActualPixelHeight <= 1099)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.053;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 1100 && androidDeviceActualPixelHeight <= 1199)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.035;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 1200 && androidDeviceActualPixelHeight <= 1299)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 1300 && androidDeviceActualPixelHeight <= 1399)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.055;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 1400 && androidDeviceActualPixelHeight <= 1499)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 1500 && androidDeviceActualPixelHeight <= 1599)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 1600 && androidDeviceActualPixelHeight <= 1699)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 1700 && androidDeviceActualPixelHeight <= 1799)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 1800 && androidDeviceActualPixelHeight <= 1899)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.10;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 1900 && androidDeviceActualPixelHeight <= 1999)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 2000 && androidDeviceActualPixelHeight <= 2099)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 2100 && androidDeviceActualPixelHeight <= 2199)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 2200 && androidDeviceActualPixelHeight <= 2299)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 2300 && androidDeviceActualPixelHeight <= 2399)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 2400 && androidDeviceActualPixelHeight <= 2499)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 2500 && androidDeviceActualPixelHeight <= 2599)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 2600 && androidDeviceActualPixelHeight <= 2699)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 2700 && androidDeviceActualPixelHeight <= 2799)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 2800 && androidDeviceActualPixelHeight <= 2899)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 2900 && androidDeviceActualPixelHeight <= 2999)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 3000 && androidDeviceActualPixelHeight <= 3099)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 3100 && androidDeviceActualPixelHeight <= 3199)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape &&
          (androidDeviceActualPixelHeight >= 3200 && androidDeviceActualPixelHeight <= 3299)) {
        adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
        return adjustedButtonHeight;
      }
    }
    // default font size
    return adjustedButtonHeight = 100.0;
  }
}
