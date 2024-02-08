import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hull_identification_number/utilities/adaptive_responsive_class.dart';
import 'package:hull_identification_number/utilities/app_theme_data_class.dart';
import 'blocs/mic_data/mic_data_cubit.dart';
import 'blocs/hin_data/hin_data_cubit.dart';
import 'repositories/mic_repository.dart';
import 'screens/definition_screen.dart';
import 'screens/home_screen_two.dart';
import 'screens/settings_screen.dart';
// import 'utilities/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreenTwo();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'definition_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const DefinitionScreen();
          },
        ),
        GoRoute(
          path: 'settings_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const SettingsScreen();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AdaptiveResponsiveClass deviceInformation = AdaptiveResponsiveClass();
  @override
  void initState() {
    super.initState();
    deviceInformation.initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MicRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MicDataCubit>(
            create: (context) => MicDataCubit(
              repository: MicRepository(),
            ),
          ),
          BlocProvider<HinDataCubit>(
            create: (context) => HinDataCubit(),
          ),
        ],
        child: MaterialApp.router(
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown
            },
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
          title: 'Portsmouth',
          // theme: appTheme,
          theme: AppThemeDataClass().getAppTheme(context),
        ),
      ),
    );
  }
}
