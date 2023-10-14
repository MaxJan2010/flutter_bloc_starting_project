import 'package:flutter/material.dart';

import '../../../data/localization/app_localizations.dart';
import '../settings/settings.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('My APP')),
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
                        builder: (context) => const MySettingsScreen(),
                      ),
                    );
                  },
                  child:  Text(AppLocalizations.of(context)!.translate('Go_To_Setting'))),
            ],
          ),
        ),
      ),
    );
  }
}
