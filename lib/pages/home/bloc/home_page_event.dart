part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {
  const HomePageEvent();
}

class HomePageTriggerEvent extends HomePageEvent {
  final int index;

  const HomePageTriggerEvent(this.index);
}
