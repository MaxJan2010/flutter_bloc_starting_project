import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'data/config/local_storage.dart';
import 'data/localization/app_localizations.dart';
import 'data/observers/app_bloc_observer.dart';
import 'logic/utility/app_connectivity/app_connectivity_bloc.dart';
import 'logic/utility/app_localization/localization_bloc.dart';
import 'logic/utility/app_theme/app_theme_bloc.dart';
import 'presentation/screens/core/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyAppBlocObserver();
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
        child: Builder(builder: (context) {
/*           var connectState =
              context.select((AppConnectivityBloc bloc) => bloc.state); */
          var langState =
              context.select((AppLocalizationBloc bloc) => bloc.state);
          var themeState = context.select((AppThemeBloc bloc) => bloc.state);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeState is AppThemeChangeState
                ? themeState.appThemeType == 'light'
                    ? ThemeData.light()
                    : ThemeData.dark()
                : ThemeData.light(),
            home: const MyHomeScreen(),
            locale: langState is AppLocalizationChangeState
                ? langState.languageCode == "en"
                    ? const Locale('en')
                    : const Locale('ar')
                : const Locale('en'),
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
        }));
  }
}
