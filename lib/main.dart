import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_hossam_hamed/data/config/local_storage.dart';
import 'package:flutter_bloc_hossam_hamed/logic/bloc/app_theme/app_theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'data/localization/app_localizations.dart';
import 'logic/bloc/app_connectivity/app_connectivity_bloc.dart';
import 'logic/bloc/app_localization/localization_bloc.dart';
import 'presentation/screens/core/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefer = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppConnectivityBloc(),
        ),
        BlocProvider(
          create: (context) =>
              AppLocalizationBloc()..add(AppLocalizationInitialEvent()),
        ),
        BlocProvider(
          create: (context) => AppThemeBloc()..add(AppThemeInitialEvent()),
        ),
      ],
      child: BlocBuilder<AppThemeBloc, AppThemeState>(
        builder: (context, themeState) {
          var speek = themeState is AppThemeChangeState
              ? themeState.appThemeType
              : 'light';
          return BlocBuilder<AppLocalizationBloc, AppLocalizationState>(
            builder: (context, langState) {
              var speek = langState is AppLocalizationChangeState
                  ? langState.languageCode
                  : 'en';
              return MaterialApp();
            },
          );
        },
      ),
    );

    /* 
    BlocProvider(
      create: (context) => AppThemeBloc()..add(AppThemeInitialEvent()),
      child: BlocBuilder<AppThemeBloc, AppThemeState>(
        builder: (context, state) {
          if (state is AppThemeLightState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              home: const MyHomeScreen(),
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
              ],
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate, // For Android
                GlobalWidgetsLocalizations.delegate, // For Widget Directions
                GlobalCupertinoLocalizations.delegate, // For IOS
              ],
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (deviceLocale != null) {
                    if (deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                }
                return supportedLocales.first;
              },
            );
          } else if (state is AppThemeDarkState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(),
              home: const MyHomeScreen(),
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
              ],
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate, // For Android
                GlobalWidgetsLocalizations.delegate, // For Widget Directions
                GlobalCupertinoLocalizations.delegate, // For IOS
              ],
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (deviceLocale != null) {
                    if (deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                }
                return supportedLocales.first;
              },
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const MyHomeScreen(),
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate, // For Android
              GlobalWidgetsLocalizations.delegate, // For Widget Directions
              GlobalCupertinoLocalizations.delegate, // For IOS
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null) {
                  if (deviceLocale.languageCode == locale.languageCode) {
                    return deviceLocale;
                  }
                }
              }
              return supportedLocales.first;
            },
          );
        },
      ),
    ); */
  }
}
