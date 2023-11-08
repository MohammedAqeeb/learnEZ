import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState()) {
    on<AppBottomNavigationEvent>((event, emit) {
      print({event.index});
      emit(ApplicationState(index: event.index));
    });
  }
}
