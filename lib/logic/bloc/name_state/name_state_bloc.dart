import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'name_state_event.dart';
part 'name_state_state.dart';

class NameStateBloc extends Bloc<NameStateEvent, NameStateState> {
  // 1- Generate the Variables.
  String name = '';
  NameStateBloc() : super(const NameStateInitial()) {
    on<NameStateEvent>((event, emit) {
      // 2- Clarify Events and Emits(States)
      if (event is InitialNameEvent) {
        // On Initial Event Start with Loading & Loaded States
        // Consider the Variable Declared Above
        // Create and Copy The emit of Loading and Loaded States to the other Emits
        emit(NameStateLoading(name: name));
        // Clarify The Action of The EVENT.
        name = 'Mohamed';
        emit(NameStateLoaded(name: name));
      } else if (event is FullNameEvent) {
        emit(NameStateLoading(name: name));
        // Clarify The Action of The EVENT.
        name = 'Mohamed Abbas';
        emit(NameStateLoaded(name: name));
      } else if (event is ClearNameEvent) {
        emit(NameStateLoading(name: name));
        // Clarify The Action of The EVENT.
        name = '';
        emit(NameStateLoaded(name: name));
      } else if (event is ResetNameEvent) {
        emit(NameStateLoading(name: name));
        // Clarify The Action of The EVENT.
        name = 'Mohamed';
        emit(NameStateLoaded(name: name));
      }
    });
  }
}
