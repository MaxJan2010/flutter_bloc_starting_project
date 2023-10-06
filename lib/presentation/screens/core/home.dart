import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/bloc/name_state/name_state_bloc.dart';
import '../lesson_four.dart';

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
                      //const MyLessonFour()),
                    );
                  },
                  child: const Text('Lesson-04 (Change Name BloC)')),
            ],
          ),
        ),
      ),
    );
  }
}
