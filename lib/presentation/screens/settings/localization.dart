import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/localization/app_localizations.dart';
import '../../../logic/utility/app_localization/localization_bloc.dart';

class MySettingsLocalizationScreen extends StatelessWidget {
  const MySettingsLocalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        AppLocalizations.of(context)!.translate('Localization'),
      )),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AppLocalizationBloc>(context)
                        .add(AppLocalizationArabicEvent());
                  },
                  child: Text(
                    AppLocalizations.of(context)!.translate('Arabic'),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AppLocalizationBloc>(context)
                          .add(AppLocalizationEnglishEvent());
                    },
                    child: Text(
                      AppLocalizations.of(context)!.translate('English'),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
