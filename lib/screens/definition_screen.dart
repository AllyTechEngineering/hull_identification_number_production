import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utilities/adaptive_responsive_class.dart';
import '../utilities/calculate_font_size_class.dart';
import '../widgets/background_decoration.dart';
// import 'package:hull_identification_number/blocs/data/mic_data_cubit.dart';
// import 'package:hull_identification_number/models/mic_data_model.dart';
// import 'package:hull_identification_number/repositories/mic_repository.dart';
// import 'package:hull_identification_number/screens/home_screen.dart';

class DefinitionScreen extends StatefulWidget {
  const DefinitionScreen({super.key});

  @override
  State<DefinitionScreen> createState() => _DefinitionScreenState();
}

class _DefinitionScreenState extends State<DefinitionScreen> {
  final CalculateFontSizeClass calculateFontSizeClass = CalculateFontSizeClass();
  final AdaptiveResponsiveClass adaptiveResponsiveClass = AdaptiveResponsiveClass();
  dynamic orientation, size, height, width;
  double elevatedButtonWidth = 0.0;
  double elevatedButtonHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    elevatedButtonWidth = adaptiveResponsiveClass.calculateButtonWidth(context);
    elevatedButtonHeight = adaptiveResponsiveClass.calculateButtonHeight(context);
    // debugPrint('Home Screen width = $width\nHome Screen height = $height');
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
          title: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'FAQ',
              style: Theme.of(context).textTheme.displayLarge,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () => context.go('/settings_screen'),
            ),
          ],
          flexibleSpace: Container(
            decoration: BackgroundDecoration.backgroundImageDecoration,
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: const TextSpan(
                              text:
                                  'History: Prior to Nov. 1,1972 there were no requirements for a HIN to be assigned to recreational boats.  Manufacturers used mostly serial numbers that were unique to that manufacturer, but had no prescribed format beyond that specific manufacturer. Nov. 1,1972 The U.S. Coast Guard required all manufacturers to affix a 12 character HIN on all domestic and imported recreational boats per 33 CFR §181.\nHere are the three formats you may find on a boat',
                              style: TextStyle(fontSize: 16.0, color: Colors.black),
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/images/straight_year_format.png',
                          fit: BoxFit.cover,
                        ),
                        const Divider(
                          thickness: 2.0,
                        ),
                        Image.asset(
                          'assets/images/model_year_format.png',
                          fit: BoxFit.cover,
                        ),
                        const Divider(
                          thickness: 2.0,
                        ),
                        Image.asset(
                          'assets/images/current_format.png',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // child: ElevatedButton(
            //   onPressed: () => context.go('/'),
            //   child: const Text('Go back to the Home screen'),
            // ),
          ),
        ),
      ),
    );
  }
}
