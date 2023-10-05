import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_hossam_hamed/logic/bloc/name_state/name_state_bloc.dart';

import 'presentation/screens/core/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Wrap widget with BlocProvider
      home: BlocProvider(
        // Import State Bloc => NameStateBloc
        create: (context) => NameStateBloc(),
        child: const MyHomeScreen(),
      ),
    );
  }
}
