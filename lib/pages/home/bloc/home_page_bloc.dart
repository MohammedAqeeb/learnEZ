import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<HomePageTriggerEvent>((event, emit) {
      print({event.index});
      emit(HomePageState(index: event.index));
    });
  }
}
