import 'package:flutter/material.dart';
import 'dart:io';

import 'constants.dart';

class CalculateFontSizeClass {
  double calculateFontSize(BuildContext context, double tbd) {
    double adjustedFontSize = 10.0;

    // devicePixelRatioValue is the number of device pixels for each logical pixel.
    dynamic devicePixelRatioValue = MediaQuery.of(context).devicePixelRatio;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;

    dynamic androidDeviceActualPixelWidth = (devicePixelRatioValue * width);
    dynamic androidDeviceActualPixelHeight = (devicePixelRatioValue * height);

    adjustedFontSize = androidDeviceActualPixelWidth / androidDeviceActualPixelHeight * 10;
    if (Platform.isIOS) {
      // iPhones: 320 w x 568 h
      // iPhone SE 1st gen
      // iPhone 5C
      // iPhone 5S
      // iPhone 5
      double iPhone320x568portraitWidth = 320;
      double iPhone320x568landscapeWidth = 568;
      if ((orientation == Orientation.portrait) && (width == 320 && height == 568)) {
        // adjustedFontSize = iPhone320x568portraitWidth * kFontSize;
        adjustedFontSize = iPhone320x568portraitWidth * kFontSizePercentage;
        // debugPrint('in iPhones: 320 w x 568 height: $height\nwidth: $width');
        return adjustedFontSize;
      } else if (orientation == Orientation.landscape && (width == 568 && height == 320)) {
        // adjustedFontSize = iPhone320x568landscapeWidth * kFontSize;
        adjustedFontSize = iPhone320x568landscapeWidth * kLandscapeFontSizePercentage;
        return adjustedFontSize;
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
        adjustedFontSize = iPhone375x667portrait * kFontSizePercentage;
        return adjustedFontSize;
      } else if (orientation == Orientation.landscape && (width == 667 && height == 375)) {
        adjustedFontSize = iPhone375x667landscape * kLandscapeFontSizePercentage;
        return adjustedFontSize;
      }
      // iPhones: 414 w x 736 h
      // iPhone 8 Plus
      // iPhone 7 Plus
      // iPhone 6s Plus
      // iPhone 6 Plus
      double iPhone414x736portrait = 414.0;
      double iPhone414x736landscape = 736.0;
      if ((orientation == Orientation.portrait) && (width == 414 && height == 736)) {
        adjustedFontSize = iPhone414x736portrait * kFontSizePercentage;
        return adjustedFontSize;
      } else if ((orientation == Orientation.landscape) && (width == 736 && height == 414)) {
        adjustedFontSize = iPhone414x736landscape * kLandscapeFontSizePercentage;
        return adjustedFontSize;
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
        adjustedFontSize = iPhone375x812portrait * kFontSizePercentage;
        return adjustedFontSize;
      } else if ((orientation == Orientation.landscape) && (width == 812 && height == 375)) {
        adjustedFontSize = iPhone375x812landscape * kLandscapeFontSizePercentage;
        return adjustedFontSize;
      }
      // iPhones: 390 w x 844 h
      // iPhone 14 - simulator
      // iPhone 13
      // iPhone 13 Pro
      // iPhone 12
      // iPhone 12 Pro
      double iPhone390x844portrait = 390.0;
      double iPhone390x844landscape = 844.0;
      if ((orientation == Orientation.portrait) && ((width == 390) && (height == 844))) {
        adjustedFontSize = iPhone390x844portrait * kFontSizePercentage;
        return adjustedFontSize;
      } else if ((orientation == Orientation.landscape) && ((width == 844) && (height == 390))) {
        adjustedFontSize = iPhone390x844landscape * kLandscapeFontSizePercentage;
        return adjustedFontSize;
      }
      // iPhones: 393 w x 852 h
      // iPhone 15 Pro - simulator
      // iPhone 15
      // iPhone 14 Pro
      double iPhone393x852portrait = 393.0;
      double iPhone393x852landscape = 852.0;
      if ((orientation == Orientation.portrait) && ((width == 393) && (height == 852))) {
        // debugPrint(
        //     'in else portrait: iPhones: 430 w x 932 h\nadjustedFontSize = $adjustedFontSize');
        adjustedFontSize = iPhone393x852portrait * kFontSizePercentage;
        return adjustedFontSize;
      } else if ((orientation == Orientation.landscape) && ((width == 852) && (height == 393))) {
        // debugPrint('in else landscape: iPhones: 852 w x 393 h');
        adjustedFontSize = iPhone393x852landscape * kLandscapeFontSizePercentage;
        return adjustedFontSize;
      }
      // iPhones: 414 w x 896 h
      // iPhone 11 Pro Max
      // iPhone 11
      // iPhone XR
      // iPhone XS Max
      double iPhone414x896portrait = 414.0;
      double iPhone414x896landscape = 896.0;
      if ((orientation == Orientation.portrait) && ((width == 414) && (height == 896))) {
        adjustedFontSize = iPhone414x896portrait * kFontSizePercentage;
        return adjustedFontSize;
      } else if ((orientation == Orientation.landscape) && ((width == 896) && (height == 414))) {
        adjustedFontSize = iPhone414x896landscape * kLandscapeFontSizePercentage;
        return adjustedFontSize;
      }
      // iPhones: 428 w x 926 h
      // iPhone 14 Plus
      // iPhone 13 Pro Max
      // iPhone 12 Pro Max
      double iPhone428x926portrait = 428.0;
      double iPhone428x926landscape = 926.0;
      if ((orientation == Orientation.portrait) && ((width == 428) && (height == 926))) {
        adjustedFontSize = iPhone428x926portrait * kFontSizePercentage;
        return adjustedFontSize;
      } else if ((orientation == Orientation.landscape) && ((width == 926) && (height == 428))) {
        adjustedFontSize = iPhone428x926landscape * kLandscapeFontSizePercentage;
        return adjustedFontSize;
      }
      // iPhones: 430 w x 932 h
      // iPhone 15 Pro Max
      // iPhone 15 Plus
      // iPhone 14 Pro Max
      double iPhone430x932portrait = 430.0;
      double iPhone430x932landscape = 932.0;
      if ((orientation == Orientation.portrait) && ((width == 430) && (height == 932))) {
        adjustedFontSize = iPhone430x932portrait * kFontSizePercentage;
        // debugPrint('in iPhone430x932portrait adjustedFontSize =$adjustedFontSize');
        return adjustedFontSize;
      } else if ((orientation == Orientation.landscape) && ((width == 932) && (height == 430))) {
        adjustedFontSize = iPhone430x932landscape * kLandscapeFontSizePercentage;
        return adjustedFontSize;
      }
      // iPads: 768 w x 1024  h
      // iPad Mini (5th gen)
      // iPad 6th gen
      // iPad 5th gen
      // iPad Pro (1st gen 9.7”)
      // iPad mini 4
      // iPad Air 2
      // iPad mini 3
      // iPad mini 2
      // iPad Air
      // iPad 4th gen
      // iPad mini
      // iPad 3rd gen
      // iPad 2
      // iPad 1st gen
      // const double kIpadPortraitFontSizePercentage = 0.06;
      // const double kIpadLandscapeFontSizePercentage = 0.03;
      double iPad768x1024portrait = 768.0;
      double iPad768x1024landscape = 1024.0;
      if ((orientation == Orientation.portrait) && ((width == 768) && (height == 1024))) {
        adjustedFontSize = iPad768x1024portrait * kIpadPortraitFontSizePercentage;
        return adjustedFontSize;
      } else if ((orientation == Orientation.landscape) && ((width == 1024) && (height == 768))) {
        adjustedFontSize = iPad768x1024landscape * kIpadLandscapeFontSizePercentage;
        return adjustedFontSize;
      }
      // iPads: 810 w x 1080  h
      // iPad 9th gen
      // iPad 8th gen
      // iPad 7th gen
      // const double kIpadPortraitFontSizePercentage = 0.05;
      // const double kIpadLandscapeFontSizePercentage = 0.03;
      double iPad810x1080portrait = 810.0;
      double iPad810x1080landscape = 1080.0;
      if ((orientation == Orientation.portrait) && ((width == 810) && (height == 1080))) {
        adjustedFontSize = iPad810x1080portrait * kIpadPortraitFontSizePercentage;
        return adjustedFontSize;
      } else if ((orientation == Orientation.landscape) && ((width == 1080) && (height == 810))) {
        adjustedFontSize = iPad810x1080landscape * kIpadLandscapeFontSizePercentage;
        return adjustedFontSize;
      }
      // iPads: 834 w x 1112  h
      // iPad Air (3rd gen)
      // iPad Pro (2nd gen 10.5")
      double iPad834x1112portrait = 834.0;
      double iPad834x1112landscape = 1112.0;
      if ((orientation == Orientation.portrait) && ((width == 834) && (height == 1112))) {
        adjustedFontSize = iPad834x1112portrait * kIpadPortraitFontSizePercentage;
        return adjustedFontSize;
      } else if ((orientation == Orientation.landscape) && ((width == 1112) && (height == 834))) {
        adjustedFontSize = iPad834x1112landscape * kIpadLandscapeFontSizePercentage;
        return adjustedFontSize;
      }
      // iPads: 744.0 w x 1113.0  h
      // iPad Mini (6th gen)
      // const double kIpadPortraitFontSizePercentage = 0.06;
      // const double kIpadLandscapeFontSizePercentage = 0.03;
      double iPad744x1113portrait = 744.0;
      double iPad744x1113landscape = 1113.0;
      if ((orientation == Orientation.portrait) && ((width == 744.0) && (height == 1133.0))) {
        adjustedFontSize = iPad744x1113portrait * kIpadPortraitFontSizePercentage;
        return adjustedFontSize;
      } else if ((orientation == Orientation.landscape) &&
          ((width == 1133.0) && (height == 744.0))) {
        adjustedFontSize = iPad744x1113landscape * kIpadLandscapeFontSizePercentage;
        return adjustedFontSize;
      }
      // iPads: 820 w x 1180  h
      // iPad 10th gen
      // iPad Air (5th gen)
      // iPad Air (4th gen)
      double iPad820x1180portrait = 820.0;
      double iPad820x1180landscape = 1180.0;
      if ((orientation == Orientation.portrait) && ((width == 820) && (height == 1180))) {
        adjustedFontSize = iPad820x1180portrait * kIpadPortraitFontSizePercentage;
        return adjustedFontSize;
      } else if ((orientation == Orientation.landscape) && ((width == 1180) && (height == 820))) {
        adjustedFontSize = iPad820x1180landscape * kIpadLandscapeFontSizePercentage;
        return adjustedFontSize;
      }
      // iPads: 834 w x 1194  h
      // iPad Pro (6th gen 11")
      // iPad Pro (5th gen 11")
      // iPad Pro (4th gen 11")
      // iPad Pro (3rd gen 11")
      double iPad834x1194portrait = 834.0;
      double iPad834x1194landscape = 1194.0;
      if ((orientation == Orientation.portrait) && ((width == 834) && (height == 1194))) {
        adjustedFontSize = iPad834x1194portrait * kIpadPortraitFontSizePercentage;
        return adjustedFontSize;
      } else if ((orientation == Orientation.landscape) && ((width == 1194) && (height == 834))) {
        adjustedFontSize = iPad834x1194landscape * kIpadLandscapeFontSizePercentage;
        return adjustedFontSize;
      }
      // iPads: 1024 w x 1366  h
      // iPad Pro (6th gen 12.9")
      // iPad Pro (5th gen 12.9")
      // iPad Pro (4th gen 12.9")
      // iPad Pro (3rd gen 12.9")
      // iPad Pro (2nd gen 12.9")
      //  iPad Pro (1st gen 12.9")
      double iPad1024x1366portrait = 1024.0;
      double iPad1024x1366landscape = 1366.0;
      if ((orientation == Orientation.portrait) && ((width == 1024) && (height == 1366))) {
        adjustedFontSize = iPad1024x1366portrait * kIpadPortraitFontSizePercentage;
        return adjustedFontSize;
      } else if ((orientation == Orientation.landscape) && ((width == 1366) && (height == 1024))) {
        adjustedFontSize = iPad1024x1366landscape * kIpadLandscapeFontSizePercentage;
        return adjustedFontSize;
      } else {
        // default font size
        return adjustedFontSize = 12.0;
      }
    }
    if (Platform.isAndroid) {
      //portrait font size
      if (orientation == Orientation.portrait) {
        if ((androidDeviceActualPixelHeight >= 400 && androidDeviceActualPixelHeight <= 499)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 500 &&
            androidDeviceActualPixelHeight <= 599)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.015;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 600 &&
            androidDeviceActualPixelHeight <= 699)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.015;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 700 &&
            androidDeviceActualPixelHeight <= 799)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.015;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 800 &&
            androidDeviceActualPixelHeight <= 899)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.015;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 900 &&
            androidDeviceActualPixelHeight <= 999)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.015;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1000 &&
            androidDeviceActualPixelHeight <= 1099)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.015;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1100 &&
            androidDeviceActualPixelHeight <= 1199)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.015;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight == 1211)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.025;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1200 &&
            androidDeviceActualPixelHeight <= 1299)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.015;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1300 &&
            androidDeviceActualPixelHeight <= 1399)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.015;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1400 &&
            androidDeviceActualPixelHeight <= 1499)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.012;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1500 &&
            androidDeviceActualPixelHeight <= 1599)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.012;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1600 &&
            androidDeviceActualPixelHeight <= 1699)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.012;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1700 &&
            androidDeviceActualPixelHeight <= 1799)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.012;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight == 1845.0 &&
            androidDeviceActualPixelWidth == 1200.0)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.021;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1800 &&
            androidDeviceActualPixelHeight <= 1899 &&
            androidDeviceActualPixelWidth != 1200.0)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.012;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight == 1917.0 &&
            androidDeviceActualPixelWidth == 1200.0)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.019;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1900 &&
            androidDeviceActualPixelHeight <= 1999 &&
            androidDeviceActualPixelWidth != 1200.0)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.025;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2000 &&
            androidDeviceActualPixelHeight <= 2099)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.010;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2100 &&
            androidDeviceActualPixelHeight <= 2199)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.010;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight == 2214.0 &&
            androidDeviceActualPixelWidth == 1440.0)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.018;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2200 &&
            androidDeviceActualPixelHeight <= 2299 &&
            androidDeviceActualPixelWidth != 1440.0)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.010;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2300 &&
            androidDeviceActualPixelHeight <= 2399)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.0085;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2400 &&
            androidDeviceActualPixelHeight <= 2499)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.0085;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2500 &&
            androidDeviceActualPixelHeight <= 2599)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.0085;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2600 &&
            androidDeviceActualPixelHeight <= 2699)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.0085;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2700 &&
            androidDeviceActualPixelHeight <= 2799)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.008;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2800 &&
            androidDeviceActualPixelHeight <= 2899)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.0085;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2900 &&
            androidDeviceActualPixelHeight <= 2999)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.0085;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 3000 &&
            androidDeviceActualPixelHeight <= 3099)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.0085;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 3100 &&
            androidDeviceActualPixelHeight <= 3199)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.008;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 3200 &&
            androidDeviceActualPixelHeight <= 3299)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.008;
          return adjustedFontSize;
        }
      }
      // landscape font size
      if (orientation == Orientation.landscape) {
        if ((androidDeviceActualPixelHeight >= 400 && androidDeviceActualPixelHeight <= 499)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.04;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 500 &&
            androidDeviceActualPixelHeight <= 599)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.025;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 600 &&
            androidDeviceActualPixelHeight <= 699)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.025;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 700 &&
            androidDeviceActualPixelHeight <= 799)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.035;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 800 &&
            androidDeviceActualPixelHeight <= 899)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.025;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 900 &&
            androidDeviceActualPixelHeight <= 999)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.025;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1000 &&
            androidDeviceActualPixelHeight <= 1099)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.019;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight == 1117.0 &&
            androidDeviceActualPixelWidth == 2000.0)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.03;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight == 1125.0 &&
            androidDeviceActualPixelWidth == 1920.0)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.035;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1100 &&
            androidDeviceActualPixelHeight <= 1199 &&
            androidDeviceActualPixelWidth != 1920.0 &&
            androidDeviceActualPixelWidth != 2000.0)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.019;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1200 &&
            androidDeviceActualPixelHeight <= 1299)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.019;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight == 1350.0 &&
            androidDeviceActualPixelWidth == 2304.0)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.03;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1300 &&
            androidDeviceActualPixelHeight <= 1399 &&
            androidDeviceActualPixelWidth != 2304.0)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1400 &&
            androidDeviceActualPixelHeight <= 1499)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1500 &&
            androidDeviceActualPixelHeight <= 1599)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1600 &&
            androidDeviceActualPixelHeight <= 1699)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1700 &&
            androidDeviceActualPixelHeight <= 1799)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1800 &&
            androidDeviceActualPixelHeight <= 1899)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 1900 &&
            androidDeviceActualPixelHeight <= 1999)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2000 &&
            androidDeviceActualPixelHeight <= 2099)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2100 &&
            androidDeviceActualPixelHeight <= 2199)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2200 &&
            androidDeviceActualPixelHeight <= 2299)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2300 &&
            androidDeviceActualPixelHeight <= 2399)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2400 &&
            androidDeviceActualPixelHeight <= 2499)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2500 &&
            androidDeviceActualPixelHeight <= 2599)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2600 &&
            androidDeviceActualPixelHeight <= 2699)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2700 &&
            androidDeviceActualPixelHeight <= 2799)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2800 &&
            androidDeviceActualPixelHeight <= 2899)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 2900 &&
            androidDeviceActualPixelHeight <= 2999)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 3000 &&
            androidDeviceActualPixelHeight <= 3099)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 3100 &&
            androidDeviceActualPixelHeight <= 3199)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        } else if ((androidDeviceActualPixelHeight >= 3200 &&
            androidDeviceActualPixelHeight <= 3299)) {
          adjustedFontSize = androidDeviceActualPixelHeight * 0.02;
          return adjustedFontSize;
        }
      }
    }
    return adjustedFontSize = 20.0;
  }
}
