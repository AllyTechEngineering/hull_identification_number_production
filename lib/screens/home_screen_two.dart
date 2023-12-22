import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/mic_data/mic_data_cubit.dart';
import '../blocs/hin_data/hin_data_cubit.dart';
import '../models/hin_data_model.dart';
import '../models/mic_data_model.dart';
import '../repositories/mic_repository.dart';
import '../utilities/decode_hin_class.dart';
import '../utilities/responsive_adaptive_class.dart';

class HomeScreenTwo extends StatefulWidget {
  const HomeScreenTwo({super.key});

  @override
  State<HomeScreenTwo> createState() => _HomeScreenTwoState();
}

class _HomeScreenTwoState extends State<HomeScreenTwo> {
  final TextEditingController hinController = TextEditingController();
  final MicRepository micRepository = MicRepository();
  final ResponsiveAdaptiveClass responsiveAdaptiveClass = ResponsiveAdaptiveClass();
  final DecodeHinClass decodeHinClass = DecodeHinClass();
  // final _formkey = GlobalKey();
  final List<String> micDataForListView = [];
  MicDataModel micDataModel = const MicDataModel();
  HinDataModel hinDataModel = const HinDataModel();
  String decodedInfo = '';

  @override
  Widget build(BuildContext context) {
    responsiveAdaptiveClass.orientation = MediaQuery.of(context).orientation;
    responsiveAdaptiveClass.size = MediaQuery.of(context).size;
    responsiveAdaptiveClass.height = responsiveAdaptiveClass.size.height;
    responsiveAdaptiveClass.width = responsiveAdaptiveClass.size.width;
    debugPrint(
        'HomeScreen orientation: ${MediaQuery.of(context).orientation}\nHeight: ${responsiveAdaptiveClass.size.height}\nWidth: ${responsiveAdaptiveClass.size.width}');
    // String micValueForValidation = '111';
    return BlocBuilder<MicDataCubit, MicDataState>(
      builder: (context, state) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.description_outlined,
                  // color: Colors.white,
                ),
                // iconSize: 40.0,
                onPressed: () => context.go('/definition_screen'),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    // color: Colors.white,
                  ),
                  onPressed: () => context.go('/settings_screen'),
                ),
              ],
              centerTitle: true,
              title: Text(
                'Boat HIN Decoder',
                style: TextStyle(
                    fontSize: responsiveAdaptiveClass.appBarTitleFontSize =
                        responsiveAdaptiveClass.selectAppBarTitleFontSize(1.0)),
              ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/ocean_background.png'),
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: responsiveAdaptiveClass.elevatedButtonWidth =
                          responsiveAdaptiveClass.selectElevatedButtonWidth(1.0),
                      height: responsiveAdaptiveClass.elevatedButtonWidth =
                          responsiveAdaptiveClass.selectElevatedButtonHeight(0.8),
                      child: TextField(
                        cursorColor: Colors.white,
                        controller: hinController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(width: 4.0, color: Colors.black),
                          ),
                          hintStyle: Theme.of(context).textTheme.displayMedium,
                          hintText: 'Enter a 12 digit HIN...',
                          prefixIcon: const Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    width: responsiveAdaptiveClass.elevatedButtonWidth =
                        responsiveAdaptiveClass.selectElevatedButtonWidth(0.75),
                    height: responsiveAdaptiveClass.elevatedButtonWidth =
                        responsiveAdaptiveClass.selectElevatedButtonHeight(0.5),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFDAFFFB),
                          Color(0xFF176B87),
                        ],
                        stops: [0.0, 0.8],
                      ),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: BlocListener<HinDataCubit, HinDataState>(
                      listener: (context, state) {},
                      child: ElevatedButton(
                        onPressed: () {
                          if (hinController.text.isNotEmpty) {
                            checkUserInputHinValidator(hinController.text.trim().toUpperCase());
                            checkUserHinEntryLength(hinController.text.trim().toUpperCase());
                            context.read<HinDataCubit>().userHinInputDecode(
                                  hinController.text.trim().toUpperCase(),
                                );
                          } else if (hinController.text.isEmpty) {
                            checkUserHinEntryLength(hinController.text.trim().toUpperCase());
                          }
                          checkUserMicEntryValidForm(hinController.text.trim().toUpperCase());
                          context.read<MicDataCubit>().getUserEnteredMicData(
                                hinController.text.trim().toUpperCase(),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 10.0,
                            // fixedSize: Size((width * 0.75), (height / 5.5)),
                            fixedSize: Size(
                                responsiveAdaptiveClass.elevatedButtonWidth =
                                    responsiveAdaptiveClass.selectElevatedButtonWidth(1.0),
                                responsiveAdaptiveClass.elevatedButtonHeight =
                                    responsiveAdaptiveClass.selectElevatedButtonHeight(1.0)),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1.0, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            backgroundColor: Colors.transparent),
                        child: Text(
                          'Decode HIN',
                          style: TextStyle(
                              fontSize: responsiveAdaptiveClass.classFontSize =
                                  responsiveAdaptiveClass.selectFontSize(1.0),
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    width: responsiveAdaptiveClass.elevatedButtonWidth =
                        responsiveAdaptiveClass.selectElevatedButtonWidth(0.75),
                    height: responsiveAdaptiveClass.elevatedButtonWidth =
                        responsiveAdaptiveClass.selectElevatedButtonHeight(0.5),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFDAFFFB),
                          Color(0xFF176B87),
                        ],
                        stops: [0.0, 0.8],
                      ),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          hinController.clear();
                          context.read<MicDataCubit>().getUserEnteredMicData('111');
                          context.read<HinDataCubit>().userHinInputDecode('');
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 10.0,
                          // fixedSize: Size((width * 0.75), (height / 5.5)),
                          fixedSize: Size(
                              responsiveAdaptiveClass.elevatedButtonWidth =
                                  responsiveAdaptiveClass.selectElevatedButtonWidth(1.0),
                              responsiveAdaptiveClass.elevatedButtonHeight =
                                  responsiveAdaptiveClass.selectElevatedButtonHeight(1.0)),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1.0, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                          backgroundColor: Colors.transparent),
                      child: Text(
                        'Clear HIN',
                        style: TextStyle(
                            fontSize: responsiveAdaptiveClass.classFontSize =
                                responsiveAdaptiveClass.selectFontSize(1.0),
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  BlocBuilder<HinDataCubit, HinDataState>(
                    builder: (context, state) {
                      final hinResults = state.hinDataResponse;
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(
                              color: Colors.white60,
                              thickness: 4,
                              endIndent: 2,
                              indent: 2,
                            ),
                            Center(
                              child: Text(
                                // decodedInfo
                                'Decoded HIN Results',
                                style: TextStyle(
                                    fontSize: responsiveAdaptiveClass.classFontSize =
                                        responsiveAdaptiveClass.selectFontSize(1.0),
                                    color: Colors.white60),
                              ),
                            ),
                            Text(
                              // decodedInfo
                              'Manuf ID: ${hinResults[0].manufIdentCode}',
                              style: TextStyle(
                                  fontSize: responsiveAdaptiveClass.classFontSize =
                                      responsiveAdaptiveClass.selectFontSize(1.0),
                                  color: Colors.white),
                            ),
                            const Divider(
                              color: Colors.white60,
                              thickness: 2,
                              endIndent: 2,
                              indent: 2,
                            ),
                            Text(
                              // decodedInfo
                              'Serial Number: ${hinResults[0].hullSerialNumber}',
                              style: TextStyle(
                                  fontSize: responsiveAdaptiveClass.classFontSize =
                                      responsiveAdaptiveClass.selectFontSize(1.0),
                                  color: Colors.white),
                            ),
                            const Divider(
                              color: Colors.white60,
                              thickness: 2,
                              endIndent: 2,
                              indent: 2,
                            ),
                            Text(
                              // decodedInfo
                              'Month of Production: ${hinResults[0].monthOfProduction}',
                              style: TextStyle(
                                  fontSize: responsiveAdaptiveClass.classFontSize =
                                      responsiveAdaptiveClass.selectFontSize(1.0),
                                  color: Colors.white),
                            ),
                            const Divider(
                              color: Colors.white60,
                              thickness: 2,
                              endIndent: 2,
                              indent: 2,
                            ),
                            Text(
                              // decodedInfo
                              'Year of Production: ${hinResults[0].yearOfProduction}',
                              style: TextStyle(
                                  fontSize: responsiveAdaptiveClass.classFontSize =
                                      responsiveAdaptiveClass.selectFontSize(1.0),
                                  color: Colors.white),
                            ),
                            const Divider(
                              color: Colors.white60,
                              thickness: 2,
                              endIndent: 2,
                              indent: 2,
                            ),
                            Text(
                              // decodedInfo
                              'Model Year: ${hinResults[0].modelYear}',
                              style: TextStyle(
                                  fontSize: responsiveAdaptiveClass.classFontSize =
                                      responsiveAdaptiveClass.selectFontSize(1.0),
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 4.0),
                  ),
                  BlocBuilder<MicDataCubit, MicDataState>(
                    builder: (context, state) {
                      if (state is LoadedState) {
                        final micResults = state.micData;
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 2.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(
                                color: Colors.white60,
                                thickness: 4,
                                endIndent: 2,
                                indent: 2,
                              ),
                              Center(
                                child: Text(
                                  'Manuf. ID Code',
                                  style: TextStyle(
                                      fontSize: responsiveAdaptiveClass.classFontSize =
                                          responsiveAdaptiveClass.selectFontSize(1.0),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white60),
                                ),
                              ),
                              Text(
                                'Manuf: ${micResults[0].company}',
                                style: TextStyle(
                                    fontSize: responsiveAdaptiveClass.classFontSize =
                                        responsiveAdaptiveClass.selectFontSize(1.0),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const Divider(
                                color: Colors.white60,
                                thickness: 2,
                                endIndent: 2,
                                indent: 2,
                              ),
                              Text(
                                'Address: ${micResults[0].address}',
                                style: TextStyle(
                                    fontSize: responsiveAdaptiveClass.classFontSize =
                                        responsiveAdaptiveClass.selectFontSize(1.0),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const Divider(
                                color: Colors.white60,
                                thickness: 2,
                                endIndent: 2,
                                indent: 2,
                              ),
                              Text(
                                'City: ${micResults[0].city}',
                                style: TextStyle(
                                    fontSize: responsiveAdaptiveClass.classFontSize =
                                        responsiveAdaptiveClass.selectFontSize(1.0),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const Divider(
                                color: Colors.white60,
                                thickness: 2,
                                endIndent: 2,
                                indent: 2,
                              ),
                              Text(
                                'State: ${micResults[0].state}',
                                style: TextStyle(
                                    fontSize: responsiveAdaptiveClass.classFontSize =
                                        responsiveAdaptiveClass.selectFontSize(1.0),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      } else if (state is ErrorState) {
                        debugPrint('In HomeScreenTwo else if state is ErrorState: $state');
                      }
                      return const Text('');
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  } //Widget build

  checkUserInputHinValidator(String userInputHin) {
    // debugPrint('In checkUserInputHinValidator and HIN is: $userInputHin');
    RegExp straightYearHinFormatRegExp = RegExp(r'^\w{1}[A-Za-z]{2}\w{5}\d{2}\d{2}$');
    bool straightYearHinFormatResult = straightYearHinFormatRegExp.hasMatch(userInputHin);
    if (straightYearHinFormatResult) {
      String tempStraightYearValue = userInputHin.substring(10, 12);
      if (tempStraightYearValue.isNotEmpty) {
        int tempYear = int.parse(tempStraightYearValue);
        if (tempYear >= 85 || tempYear <= 71) {
          debugPrint('Valid year: 1972 to 1984: $tempYear');
          setState(() {
            const snackBar = SnackBar(
              duration: Duration(seconds: 2),
              content: Text(
                'Check Straight Year Format last two digits: Valid Years are 72 to 84.',
                style: TextStyle(fontSize: 30.0),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        } else if (tempYear >= 72 || tempYear <= 84) {
          setState(() {
            const snackBar = SnackBar(
              duration: Duration(seconds: 2),
              content: Text(
                'Straight Year Format',
                style: TextStyle(fontSize: 30.0),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        }
      }
    }
    RegExp modelYearHinFormatLastDigitErrorRegExp =
        RegExp(r'^\w{1}[A-Za-z]{2}\w{5}[M-m]{1}\d{2}\d{1}$');
    bool modelYearHinFormatLastDigitResult =
        modelYearHinFormatLastDigitErrorRegExp.hasMatch(userInputHin);
    if (modelYearHinFormatLastDigitResult) {
      // debugPrint('modelYearFormatResult test using RegExp: $modelYearHinFormatResult');
      setState(() {
        const snackBar = SnackBar(
          duration: Duration(seconds: 2),
          content: Text(
            'Model Year Format but last digit is a number - should be A - L',
            style: TextStyle(fontSize: 30.0),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
      return;
    }
    RegExp modelYearHinFormatRegExp = RegExp(r'^\w{1}[A-Za-z]{2}\w{5}[M-m]{1}\d{2}[A-La-l]{1}$');
    bool modelYearHinFormatResult = modelYearHinFormatRegExp.hasMatch(userInputHin);
    if (modelYearHinFormatResult) {
      // debugPrint('modelYearFormatResult test using RegExp: $modelYearHinFormatResult');

      String tempModelYearValue = userInputHin.substring(9, 11);
      if (tempModelYearValue.isNotEmpty) {
        int tempModelYear = int.parse(tempModelYearValue);
        if (tempModelYear >= 85 || tempModelYear <= 71) {
          debugPrint('Valid year: 1972 to 1984: $tempModelYear');
          setState(() {
            const snackBar = SnackBar(
              duration: Duration(seconds: 2),
              content: Text(
                'Check Model Year Format digits 10 & 11: Valid Years are 72 to 84.',
                style: TextStyle(fontSize: 30.0),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
          return;
        } else if (tempModelYear >= 72 || tempModelYear <= 84) {
          setState(() {
            const snackBar = SnackBar(
              duration: Duration(seconds: 2),
              content: Text(
                'Model Year Format',
                style: TextStyle(fontSize: 30.0),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        }
      }
    }

    RegExp currentHinFormatRegExp = RegExp(r'^\w{1}[A-Za-z]{2}\w{5}[A-La-l]{1}\d{1}\d{2}$');
    bool currentHinYearFormatResult = currentHinFormatRegExp.hasMatch(userInputHin);
    if (currentHinYearFormatResult) {
      String tempCurrentHinYearValue = userInputHin.substring(10, 12);
      if (tempCurrentHinYearValue.isNotEmpty) {
        int tempCurrentHinYear = int.parse(tempCurrentHinYearValue);
        if (tempCurrentHinYear <= 83) {
          if (tempCurrentHinYear >= 60) {
            debugPrint('Current HIN: 1984 to Present - Please Check Input $tempCurrentHinYear');
            setState(() {
              const snackBar = SnackBar(
                duration: Duration(seconds: 4),
                content: Text(
                  'Error! the last 2 digits of the current HIN years are 84 to present.',
                  style: TextStyle(fontSize: 30.0),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
            return;
          } else if (tempCurrentHinYear >= 0) {
            setState(() {
              const snackBar = SnackBar(
                duration: Duration(seconds: 2),
                content: Text(
                  'Current HIN Format',
                  style: TextStyle(fontSize: 30.0),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
          }
        } else if (tempCurrentHinYear >= 0) {
          setState(() {
            const snackBar = SnackBar(
              duration: Duration(seconds: 2),
              content: Text(
                'Current HIN Format',
                style: TextStyle(fontSize: 30.0),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        }
      }
    } // if current HIN

    if (!modelYearHinFormatResult && !straightYearHinFormatResult && !currentHinYearFormatResult) {
      setState(() {
        const snackBar = SnackBar(
          duration: Duration(seconds: 3),
          content: Text(
            'Please check the HIN Format!',
            style: TextStyle(fontSize: 30.0),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  } //userInput

  checkUserMicEntryValidForm(String userInputHin) {
    RegExp micFormatAllNumericRegExp = RegExp(r'^\d{3}$');
    bool micFormatAllNumericResult = micFormatAllNumericRegExp.hasMatch(userInputHin);
    if (micFormatAllNumericResult) {
      setState(() {
        const snackBar = SnackBar(
          duration: Duration(seconds: 3),
          content: Text(
            'MIC is incorrect. Please try again!',
            style: TextStyle(fontSize: 30.0),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }

  void checkUserHinEntryLength(String userHinEntry) {
    // debugPrint('userHinEntry.length: ${userHinEntry.length}');
    if (userHinEntry.length != 12 || userHinEntry.isEmpty) {
      setState(() {
        const snackBar = SnackBar(
          duration: Duration(seconds: 3),
          content: Text(
            'The HIN is 12 characters. Please try again!',
            style: TextStyle(fontSize: 30.0),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }
} //class
