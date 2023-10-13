import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/bloc/app_connectivity/app_connectivity_bloc.dart';

class MyLessonFiveScreen extends StatelessWidget {
  const MyLessonFiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson Five'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // After Adding The BlocProvider around The Targeted Widget
              // Create The onPress Actions of the below buttons by adding BlocProvider.
              // Add the Event of each button.
            
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // Add BlocBuilder to the Widget which will be rebuilt.
                // Apply Targeted Bloc and State (NameStateBloc & NameStateState).
                child: BlocBuilder<AppConnectivityBloc, AppConnectivityState>(
                  builder: (context, state) {
                    // Create If State is Loading and Loaded Conditions.
                    if (state is AppConnectivityTrueState) {
                      return Center(child: Text(state.connectivityMessage));
                    } else if (state is AppConnectivityFalseState) {
                      return Center(child: Text(state.connectivityMessage));
                    }
                    // The Widget must contain return.
                    return const Center(child: Text('Every Thing Is OK'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
