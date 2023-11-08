part of 'application_bloc.dart';

@immutable
sealed class ApplicationEvent {
  const ApplicationEvent();
}

class AppBottomNavigationEvent extends ApplicationEvent {
  final int index;

  const AppBottomNavigationEvent(this.index);
}
