import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_hossam_hamed/logic/bloc/app_theme/app_theme_bloc.dart';

// import '../../../logic/bloc/name_state/name_state_bloc.dart';

class MyLessonSixScreen extends StatelessWidget {
  const MyLessonSixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson Six'),
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
                  BlocProvider.of<AppThemeBloc>(context).add(AppThemeLightEvent());
                },
                child: const Text('Light Theme'),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AppThemeBloc>(context).add(AppThemeDarkEvent());
                },
                child: const Text('Dark Theme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
