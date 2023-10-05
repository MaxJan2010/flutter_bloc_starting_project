import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_hossam_hamed/logic/bloc/name_state/name_state_bloc.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // After Adding The BlocProvider around The Targeted Widget
          // Create The onPress Actions of the below buttons by adding BlocProvider.
          // Add the Event of each button.
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<NameStateBloc>(context).add(FullNameEvent());
            },
            child: const Text('Full Name'),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<NameStateBloc>(context).add(ClearNameEvent());
            },
            child: const Text('Clear Name'),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<NameStateBloc>(context).add(ResetNameEvent());
            },
            child: const Text('Reset Name'),
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // Add BlocBuilder to the Widget which will be rebuilt.
        // Apply Targeted Bloc and State (NameStateBloc & NameStateState).
        child: BlocBuilder<NameStateBloc, NameStateState>(
          builder: (context, state) {
            // Create If State is Loading and Loaded Conditions.
            if (state is NameStateLoading) {
              return Center(child: Text(state.name!));
            } else if (state is NameStateLoaded) {
              return Center(child: Text(state.name!));
            }
            // The Widget must contain return.
            return const Center(child: Text(''));
          },
        ),
      ),
    );
  }
}
