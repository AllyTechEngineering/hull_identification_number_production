import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:hull_identification_number/utilities/device_info_class.dart';
import '../blocs/mic_data/mic_data_cubit.dart';
import '../blocs/hin_data/hin_data_cubit.dart';
import '../models/hin_data_model.dart';
import '../models/mic_data_model.dart';
import '../repositories/mic_repository.dart';
import '../utilities/adaptive_responsive_class.dart';
import '../utilities/calculate_font_size_class.dart';
import '../utilities/constants.dart';
import '../utilities/decode_hin_class.dart';
import '../utilities/hin_validator.dart';
import '../widgets/background_decoration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AdaptiveResponsiveClass deviceInformation = AdaptiveResponsiveClass();
  final ScrollController scrollController = ScrollController();
  final CalculateFontSizeClass calculateFontSizeClass = CalculateFontSizeClass();
  final AdaptiveResponsiveClass adaptiveResponsiveClass = AdaptiveResponsiveClass();
  final TextEditingController hinController = TextEditingController();
  final MicRepository micRepository = MicRepository();
  final DecodeHinClass decodeHinClass = DecodeHinClass();
  dynamic orientation, size, height, width;
  double? sizeBoxHeight;
  double elevatedButtonWidth = 0.0;
  double elevatedAndroidButtonWidth = 0.0;
  double elevatedAndroidButtonHeight = 0.0;
  bool orientationTestValue = true;
  double elevatedButtonHeight = 0.0;
  dynamic devicePixelRatioValue;
  final List<String> micDataForListView = [];
  MicDataModel micDataModel = const MicDataModel();
  HinDataModel hinDataModel = const HinDataModel();
  String decodedInfo = '';

  Future<void> getAndroidDisplayHeightMethod() async {
    double? tempValue = await adaptiveResponsiveClass.getAndroidDisplayInchesValueMethod();
    elevatedAndroidButtonHeight = tempValue!;
  }

  Future<void> getAndroidDisplayWidthWandHMethod(bool orientationValue) async {
    debugPrint('orientationValue: $orientationValue');
    double? tempWidthValue =
        await adaptiveResponsiveClass.getAndroidDisplayWidthPixelsValueMethod();
    debugPrint('Top of getAndroidDisplayWidthWandHMethod: tempWidthValue= $tempWidthValue');
    double? tempHeightValue =
        await adaptiveResponsiveClass.getAndroidDisplayHeightPixelsValueMethod();
    debugPrint('Top of getAndroidDisplayWidthWandHMethod: tempHeightValue= $tempHeightValue');

    elevatedAndroidButtonWidth = tempWidthValue!;
    elevatedAndroidButtonHeight = tempHeightValue!;
    debugPrint(
        'after getting w and h from tempValue. Width: $elevatedAndroidButtonWidth\n Height: $elevatedAndroidButtonHeight');

    // Portrait button width
    if (orientationValue == true) {
      debugPrint('In if (orientationValue == true) which is portrait');
      if (elevatedAndroidButtonWidth <= 500) {
        elevatedAndroidButtonWidth = elevatedAndroidButtonWidth * .40;
        debugPrint('<= 500: elevatedAndroidButtonWidth: $elevatedAndroidButtonWidth ');
      } else if (elevatedAndroidButtonWidth >= 501 && elevatedAndroidButtonWidth <= 800) {
        elevatedAndroidButtonWidth = elevatedAndroidButtonWidth * .50;
        debugPrint('501 to 800: elevatedAndroidButtonWidth: $elevatedAndroidButtonWidth ');
      } else if (elevatedAndroidButtonWidth >= 801 && elevatedAndroidButtonWidth <= 1200) {
        elevatedAndroidButtonWidth = elevatedAndroidButtonWidth * .50;
        debugPrint('801 to 1200: elevatedAndroidButtonWidth: $elevatedAndroidButtonWidth ');
      } else if (elevatedAndroidButtonWidth >= 1201 && elevatedAndroidButtonWidth <= 1500) {
        elevatedAndroidButtonWidth = elevatedAndroidButtonWidth * .20;
        debugPrint('1201 to 1500: elevatedAndroidButtonWidth: $elevatedAndroidButtonWidth ');
      } else if (elevatedAndroidButtonWidth >= 1501 && elevatedAndroidButtonWidth <= 2000) {
        elevatedAndroidButtonWidth = elevatedAndroidButtonWidth * .50;
        debugPrint('1501 to 2000: elevatedAndroidButtonWidth: $elevatedAndroidButtonWidth ');
      }
    }
    //Landscape
    if (orientationValue == false) {
      debugPrint('In if (orientationValue == false) which is landscape');
      if (elevatedAndroidButtonHeight <= 1200) {
        elevatedAndroidButtonWidth = elevatedAndroidButtonWidth * .60;
        debugPrint('<= 1200: elevatedAndroidButtonHeight: $elevatedAndroidButtonWidth ');
      } else if (elevatedAndroidButtonHeight >= 1201 && elevatedAndroidButtonHeight <= 1800) {
        elevatedAndroidButtonWidth = elevatedAndroidButtonWidth * .60;
        debugPrint('1201 to 1800: elevatedAndroidButtonHeight: $elevatedAndroidButtonWidth ');
      } else if (elevatedAndroidButtonHeight >= 1801 && elevatedAndroidButtonHeight <= 2200) {
        elevatedAndroidButtonWidth = elevatedAndroidButtonWidth * .60;
        debugPrint('1801 to 2200: elevatedAndroidButtonHeight: $elevatedAndroidButtonWidth ');
      } else if (elevatedAndroidButtonHeight >= 2201 && elevatedAndroidButtonHeight <= 2400) {
        elevatedAndroidButtonWidth = elevatedAndroidButtonWidth * .70;
        debugPrint('2201 to 2400: elevatedAndroidButtonHeight: $elevatedAndroidButtonWidth ');
      } else if (elevatedAndroidButtonWidth >= 2401 && elevatedAndroidButtonWidth <= 2800) {
        elevatedAndroidButtonWidth = elevatedAndroidButtonWidth * .80;
        debugPrint('2401 to 2800: elevatedAndroidButtonHeight: $elevatedAndroidButtonWidth ');
      } else if (elevatedAndroidButtonHeight >= 2801 && elevatedAndroidButtonHeight <= 3200) {
        elevatedAndroidButtonWidth = elevatedAndroidButtonWidth * .50;
        debugPrint('2801 to 3200: elevatedAndroidButtonHeight: $elevatedAndroidButtonWidth ');
      }
    }
  }

  // using orientationTestValue to avoid issues with MediaQuery in a Future
  // true = portrait
  // false == landscape
  void getOrientationValue() {
    if (orientation == Orientation.portrait) {
      orientationTestValue = true;
    } else if (orientation == Orientation.landscape) {
      orientationTestValue = false;
    }
  }

  void getOrientationSetState() {
    if (orientation == Orientation.portrait) {
      debugPrint('In getOrientationSetState if (orientation == Orientation.portrait)');
      setState(() {
        orientationTestValue = true;
        getAndroidDisplayHeightMethod();
        getAndroidDisplayWidthWandHMethod(orientationTestValue);
      });
    } else if (orientation == Orientation.landscape) {
      debugPrint('In getOrientationSetState else if (orientation == Orientation.landscape)');
      setState(() {
        getAndroidDisplayHeightMethod();
        orientationTestValue = false;
        getAndroidDisplayWidthWandHMethod(orientationTestValue);
      });
    }
  }

  @override
  void initState() {
    getOrientationValue();
    getAndroidDisplayHeightMethod();
    getAndroidDisplayWidthWandHMethod(orientationTestValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('In Widget build above the methods to change the width');

    getOrientationSetState();

    devicePixelRatioValue = MediaQuery.of(context).devicePixelRatio;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    orientation = MediaQuery.of(context).orientation;
    elevatedButtonWidth = adaptiveResponsiveClass.calculateButtonWidth(context);
    elevatedButtonHeight = adaptiveResponsiveClass.calculateButtonHeight(context);
    adaptiveResponsiveClass.getPlatformTypeMethod();
    InputDecorationTheme currentTheme = Theme.of(context).inputDecorationTheme;
    debugPrint('What is going on? elevatedAndroidButtonWidth: $elevatedAndroidButtonWidth ');
    InputDecoration hinInputDecoration = InputDecoration(
      // Your original decoration properties
      enabledBorder: currentTheme.border,
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(35.0)),
        borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      hintStyle: Theme.of(context).textTheme.displaySmall,
      hintText: 'Enter a 12 digit HIN...',
      prefixIcon: const Icon(
        Icons.search,
        size: kPrefixIconSize,
      ),
      prefixIconColor: currentTheme.prefixIconColor,
      prefixStyle: currentTheme.prefixStyle,
    );
    return BlocBuilder<MicDataCubit, MicDataState>(
      builder: (context, state) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
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
                style: Theme.of(context).textTheme.displayLarge,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              flexibleSpace: Container(
                decoration: BackgroundDecoration.backgroundImageDecoration,
              ),
            ),
            body: Container(
              constraints: const BoxConstraints.expand(),
              decoration: BackgroundDecoration.backgroundImageDecoration,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50.0,
                        child: TextField(
                          cursorColor: Colors.white,
                          controller: hinController,
                          decoration: hinInputDecoration,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      width: elevatedAndroidButtonWidth,
                      height: elevatedButtonHeight,
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
                              fixedSize: Size(elevatedAndroidButtonWidth, elevatedButtonHeight),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 1.0, style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(35.0),
                              ),
                              backgroundColor: Colors.transparent),
                          child: Text(
                            'Decode HIN',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      width: elevatedAndroidButtonWidth,
                      height: elevatedButtonHeight,
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
                            elevation: elevatedAndroidButtonWidth,
                            fixedSize: Size(432, elevatedButtonHeight),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1.0, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            backgroundColor: Colors.transparent),
                        child: Text(
                          'Clear HIN',
                          style: Theme.of(context).textTheme.bodyLarge,
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
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              Text(
                                // decodedInfo
                                'Manuf ID: ${hinResults[0].manufIdentCode}',
                                style: Theme.of(context).textTheme.bodyLarge,
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
                                style: Theme.of(context).textTheme.bodyLarge,
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
                                style: Theme.of(context).textTheme.bodyLarge,
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
                                style: Theme.of(context).textTheme.bodyLarge,
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
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Divider(
                                color: Colors.white60,
                                thickness: 2,
                                endIndent: 2,
                                indent: 2,
                              ),
                              Text(
                                // decodedInfo
                                'Elev B H-W: $elevatedAndroidButtonWidth $elevatedAndroidButtonHeight',
                                style: Theme.of(context).textTheme.bodyLarge,
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
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                                Text(
                                  'Manuf: ${micResults[0].company}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Divider(
                                  color: Colors.white60,
                                  thickness: 2,
                                  endIndent: 2,
                                  indent: 2,
                                ),
                                Text(
                                  'Address: ${micResults[0].address}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Divider(
                                  color: Colors.white60,
                                  thickness: 2,
                                  endIndent: 2,
                                  indent: 2,
                                ),
                                Text(
                                  'City: ${micResults[0].city}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Divider(
                                  color: Colors.white60,
                                  thickness: 2,
                                  endIndent: 2,
                                  indent: 2,
                                ),
                                Text(
                                  'State: ${micResults[0].state}',
                                  style: Theme.of(context).textTheme.bodyLarge,
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
          ),
        );
      },
    );
  } //Widget build

  void checkUserInputHinValidator(String userInputHin) {
    HinValidator.checkUserInputHinValidator(
      context: context,
      userInputHin: userInputHin,
      showSnackBar: (context, message) {
        setState(() {
          final snackBar = SnackBar(
            duration: const Duration(seconds: 3),
            content: Text(
              message,
              style: const TextStyle(fontSize: 30.0),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      },
    );
  }

  void checkUserMicEntryValidForm(String userInputHin) {
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
