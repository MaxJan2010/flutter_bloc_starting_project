import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/localization/app_localizations.dart';
import '../../../logic/bloc/app_localization/localization_bloc.dart';

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
                    BlocProvider.of<AppLocalizationBloc>(context)
                        .add(AppLocalizationArabicEvent());
                  },
                  child: const Text('Arabic'),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AppLocalizationBloc>(context)
                        .add(AppLocalizationEnglishEvent());
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
