import 'package:flutter/material.dart';
import 'package:flutter_bloc_hossam_hamed/data/localization/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_hossam_hamed/logic/bloc/localization/localization_bloc.dart';

class MyLessonLocalizationScreen extends StatelessWidget {
  const MyLessonLocalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localization By Pure Flutter'),
      ),
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
                    BlocProvider.of<LocalizationBloc>(context)
                        .add(LocalizationArabicEvent());
                  },
                  child: const Text('Arabic'),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<LocalizationBloc>(context)
                        .add(LocalizationEnglishEvent());
                  },
                  child: const Text('English'),
                ),
                Text(AppLocalizations.of(context)!.translate('home_page'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
