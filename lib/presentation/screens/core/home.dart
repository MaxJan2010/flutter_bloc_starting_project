import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_hossam_hamed/presentation/screens/tutorials/lesson_localization.dart';

import '../../../logic/bloc/check_internet_connect/check_internet_connectivity_bloc.dart';
import '../../../logic/bloc/name_state/name_state_bloc.dart';
// import '../../../logic/bloc/app_theme/app_theme_bloc.dart';

import '../tutorials/lesson_four.dart';
import '../tutorials/lesson_five.dart';
import '../tutorials/lesson_six.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Flutter BloC Tutorial')),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          // Import State Bloc => NameStateBloc
                          create: (context) => NameStateBloc(),
                          child: const MyLessonFour(),
                        ),
                      ),
                    );
                  },
                  child: const Text('Lesson-04 (Change Name BloC)')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          // Import State Bloc => NameStateBloc
                          create: (context) => CheckInternetConnectivityBloc(),
                          child: const MyLessonFiveScreen(),
                        ),
                      ),
                    );
                  },
                  child:
                      const Text('Lesson-05 (Check Internet Connection BloC)')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyLessonSixScreen()),
                    );
                  },
                  child: const Text('Lesson-06 (App Theme BloC)')),
                                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyLessonLocalizationScreen()),
                    );
                  },
                  child: const Text('Lesson-Translation (Localization Flutter)')),
            ],
          ),
        ),
      ),
    );
  }
}
