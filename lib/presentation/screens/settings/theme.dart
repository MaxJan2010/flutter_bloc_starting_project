import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/localization/app_localizations.dart';
import '../../../logic/utility/app_theme/app_theme_bloc.dart';

class MySettingsThemeScreen extends StatelessWidget {
  const MySettingsThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.translate('Theme'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AppThemeBloc>(context)
                        .add(AppThemeLightEvent());
                  },
                  child: 
                  Text(
                    AppLocalizations.of(context)!.translate('Light_Theme'),
                  )),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AppThemeBloc>(context)
                      .add(AppThemeDarkEvent());
                },
                child: Text(
                  AppLocalizations.of(context)!.translate('Dark_Theme'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
