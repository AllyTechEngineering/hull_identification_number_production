// hin_validator.dart

import 'package:flutter/material.dart';

class HinValidator {
  static void checkUserInputHinValidator({
    required BuildContext context,
    required String userInputHin,
    required Function(BuildContext, String) showSnackBar,
  }) {
    // debugPrint('In checkUserInputHinValidator and HIN is: $userInputHin');
    RegExp straightYearHinFormatRegExp = RegExp(r'^\w[A-Za-z]{2}\w{5}\d{2}\d{2}$');
    bool straightYearHinFormatResult = straightYearHinFormatRegExp.hasMatch(userInputHin);
    if (straightYearHinFormatResult) {
      String tempStraightYearValue = userInputHin.substring(10, 12);
      if (tempStraightYearValue.isNotEmpty) {
        int tempYear = int.parse(tempStraightYearValue);
        if (tempYear >= 85 || tempYear <= 71) {
          // debugPrint('Valid year: 1972 to 1984: $tempYear');
          showSnackBar(
              context, 'Check Straight Year Format last two digits: Valid Years are 72 to 84.');
        } else if (tempYear >= 72 || tempYear <= 84) {
          showSnackBar(context, 'Straight Year Format');
        }
      }
    }
    RegExp modelYearHinFormatLastDigitErrorRegExp = RegExp(r'^\w[A-Za-z]{2}\w{5}[M-m]\d{2}\d$');
    bool modelYearHinFormatLastDigitResult =
        modelYearHinFormatLastDigitErrorRegExp.hasMatch(userInputHin);
    if (modelYearHinFormatLastDigitResult) {
      showSnackBar(context, 'Model Year Format but last digit is a number - should be A - L');
    }
    RegExp modelYearHinFormatRegExp = RegExp(r'^\w[A-Za-z]{2}\w{5}[M-m]\d{2}[A-La-l]$');
    bool modelYearHinFormatResult = modelYearHinFormatRegExp.hasMatch(userInputHin);
    if (modelYearHinFormatResult) {
      String tempModelYearValue = userInputHin.substring(9, 11);
      if (tempModelYearValue.isNotEmpty) {
        int tempModelYear = int.parse(tempModelYearValue);
        if (tempModelYear >= 85 || tempModelYear <= 71) {
          // debugPrint('Valid year: 1972 to 1984: $tempModelYear');
          showSnackBar(
              context, 'Check Model Year Format digits 10 & 11: Valid Years are 72 to 84.');
        } else if (tempModelYear >= 72 || tempModelYear <= 84) {
          showSnackBar(context, 'Model Year Format');
        }
      }
    }
    RegExp currentHinFormatRegExp = RegExp(r'^\w[A-Za-z]{2}\w{5}[A-La-l]\d\d{2}$');
    bool currentHinYearFormatResult = currentHinFormatRegExp.hasMatch(userInputHin);
    if (currentHinYearFormatResult) {
      String tempCurrentHinYearValue = userInputHin.substring(10, 12);
      if (tempCurrentHinYearValue.isNotEmpty) {
        int tempCurrentHinYear = int.parse(tempCurrentHinYearValue);
        if (tempCurrentHinYear <= 83) {
          if (tempCurrentHinYear >= 60) {
            // debugPrint('Current HIN: 1984 to Present - Please Check Input $tempCurrentHinYear');
            showSnackBar(
                context, 'Error! the last 2 digits of the current HIN years are 84 to present.');
          } else if (tempCurrentHinYear >= 0) {
            showSnackBar(context, 'Current HIN Format');
          }
        } else if (tempCurrentHinYear >= 0) {
          showSnackBar(context, 'Current HIN Format');
        }
      }
    } // if current HIN
    if (!modelYearHinFormatResult && !straightYearHinFormatResult && !currentHinYearFormatResult) {
      showSnackBar(context, 'Please check the HIN Format!');
    }
  }
}
