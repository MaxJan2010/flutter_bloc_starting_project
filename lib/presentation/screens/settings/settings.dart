import 'package:flutter/material.dart';
import '../../../data/localization/app_localizations.dart';
import '../export_screens.dart';

class MySettingsScreen extends StatelessWidget {
  const MySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child:
                Text(AppLocalizations.of(context)!.translate('App_Settings'))),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const MySettingsLocalizationScreen(),
                      ),
                    );
                  },
                  child: Text(
                      AppLocalizations.of(context)!.translate('App_Language'))),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MySettingsThemeScreen(),
                      ),
                    );
                  },
                  child: Text(
                      AppLocalizations.of(context)!.translate('App_Theme'))),
            ],
          ),
        ),
      ),
    );
  }
}
